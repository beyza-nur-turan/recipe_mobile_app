import 'package:flutter/material.dart';
import 'core/config/app_router.gr.dart';


void main() { runApp(const MyApp());}

 final router= AppRouter();
class MyApp extends StatelessWidget {
  
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp.router(
      title: "demo",
      theme: ThemeData(primarySwatch: Colors.blue),
      routerDelegate:router.delegate() ,
      routeInformationParser: router.defaultRouteParser(),
      // debugShowCheckedModeBanner: false,
    );
  }
}