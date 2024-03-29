import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:loginn/Screens/HomePage.dart';
//import 'Home.dart';
import 'Introduction.dart';
import 'Language.dart';
import 'auth/Auth.dart';
import 'core/config/app_router.gr.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart'; // durum çubuğu gizlenmesi için
import 'package:firebase_storage/firebase_storage.dart';
final FlutterLocalization localization = FlutterLocalization.instance;
Future<void> main()async {WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();
FirebaseStorage storage = FirebaseStorage.instance;
   runApp(const MyApp());}

 final router= AppRouter();
 
class MyApp extends StatefulWidget {
  
  const MyApp({super.key});
  
    @override
  State<MyApp> createState() => _MyAppState();}
  class _MyAppState extends State<MyApp>{

  @override
void initState() {
    localization.init(
        mapLocales: [
            const MapLocale('en', AppLocale.EN),
            const MapLocale('tr', AppLocale.TR),
        ],
        initLanguageCode: 'tr',
    );
    localization.onTranslatedLanguage = _onTranslatedLanguage;
    super.initState();
}


void _onTranslatedLanguage(Locale? locale) {
    setState(() {});
}
  Widget build(BuildContext context) {
    //uygulamada üstteki durum çubuğunu gizlemek için aşağıdaki kod kullanıldı
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
   SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
  statusBarColor: Colors.transparent, // Durum çubuğu arka plan rengi
  statusBarIconBrightness: Brightness.light, // Durum çubuğu ikonları rengi
  
));

   runApp(const MyApp());
    return  MultiProvider(
      providers: [
        Provider<FirebaseAuthMethods>(
          create: (_) => FirebaseAuthMethods(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<FirebaseAuthMethods>().authState,
          initialData: null,
        ),
      ],
      child: MaterialApp.router(
       supportedLocales: localization.supportedLocales,
        localizationsDelegates: localization.localizationsDelegates,
      debugShowCheckedModeBanner: false,
      title: "demo",
      theme: ThemeData(primarySwatch: Colors.blue),
      routerDelegate:router.delegate() ,//Gezinme (routing) işlemlerini yönetmek için kullanılan sınıfları belirtir. 
      routeInformationParser: router.defaultRouteParser(),
       
    ));
  }
}
class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();
    

    if (firebaseUser != null) {
      return const HomePage();
    }
    return  const IntroductionPage();
  }
}