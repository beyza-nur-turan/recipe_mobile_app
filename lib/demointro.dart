import 'package:flutter/material.dart';
import 'package:loginn/core/config/app_router.gr.dart';
import 'package:loginn/main.dart';
import 'package:loginn/widgets/FieldButtonWidget.dart';
import 'package:lottie/lottie.dart';

class Demointro extends StatelessWidget {
  const Demointro({super.key});
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: MediaQuery.of(context).size.width * 1,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color.fromARGB(255, 220, 232, 242),
        Color.fromARGB(255, 116, 114, 189),
      ],
    ),
                image: DecorationImage(
                    image: AssetImage("assets/images/intro-removebg-preview (1).png"),
                    fit: BoxFit.fitWidth)),
                    
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 100),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding:const  EdgeInsets.only(top: 40),
                        child: FieldButton(onTap: (){ Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Lottie.network(
              'https://assets10.lottiefiles.com/packages/lf20_sqg0bxz5.json',
              width: 200,
              height: 200,
            ),
           const Text("Pişiriliyor...")
          ],
        ),
      ) ;router.push(const SignIn());},text:'  Giriş Yap',),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 99),
                  child: FieldButton(text: 'Kayıt Ol', onTap:(){ router.push(const SignUp());}),
                ),
              ],
            )));
  }
}


