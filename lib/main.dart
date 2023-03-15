import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Home.dart';
import 'Introduction.dart';
import 'auth/signupAuth.dart';
import 'core/config/app_router.gr.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:loginn/demointro.dart';
import 'package:loginn/Screens/SignIn.dart';


Future<void> main()async {WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();
   runApp(const MyApp());}

 final router= AppRouter();
class MyApp extends StatelessWidget {
  
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
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
      debugShowCheckedModeBanner: false,
      title: "demo",
      theme: ThemeData(primarySwatch: Colors.blue),
      routerDelegate:router.delegate() ,
      routeInformationParser: router.defaultRouteParser(),
      // debugShowCheckedModeBanner: false,
    ));
  }
}
class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();

    if (firebaseUser != null) {
      return Home();
    }
    return  IntroductionPage();
  }
}
