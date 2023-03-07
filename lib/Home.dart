// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:loginn/Screens/SignIn.dart';
import 'package:loginn/Screens/SignUp.dart';
import 'package:loginn/widgets/textwidget.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SignIn()
    );
  }
}