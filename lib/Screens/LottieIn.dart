import 'package:flutter/material.dart';
import 'package:loginn/core/config/app_router.gr.dart';
import 'package:loginn/main.dart';
import 'package:lottie/lottie.dart';
class LottieInPage extends StatefulWidget {
  const LottieInPage({super.key});

  @override
  State<LottieInPage> createState() => _LottieInPageState();
}

class _LottieInPageState extends State<LottieInPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      router.push(const SignIn());
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(margin:const EdgeInsets.only(left:10),
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children:[ Lottie.asset(
            'assets/lottie/cooking.json',
            width: 350,
            height: 350,
          ),const Text("Pişiriliyor...",style:TextStyle(fontSize: 25,color: Color(0xff606ad9)),)
          ]
        ),
      ),
    );
  }
}