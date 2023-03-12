// ignore_for_file: file_names

import 'package:flutter/material.dart';
 import 'package:loginn/Screens/SignUp.dart';
// import 'package:loginn/widgets/textwidget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(resizeToAvoidBottomInset: false,//login de resmin kaymasını engellendi
      body: SignUp());}
}