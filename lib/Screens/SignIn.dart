// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:loginn/constants.dart';
import 'package:loginn/widgets/textSigninWidget.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/login.jpg'), fit: BoxFit.cover),
        ),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 60, left: 50),
                width: 220,
                height: 180,
                color: Colors.transparent,
                child: ClipOval(child: Image.asset('assets/images/22.png')),
              ),
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 30, right: 30),
                        child: Column(
                          children: [
                            const TextFormFieldWidget(
                                deger: "E-Mail", icon: Icons.person),
                            const SizedBox(
                              height: 30,
                            ),
                            const TextFormFieldWidget(
                              deger: "Şifre",
                              icon: Icons.lock,
                              suffixIcon: Icons.visibility,
                              sufIconColor: siyah,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 40),
                              child: MaterialButton(
                                onPressed: () {},
                                color: siyah,
                                elevation: 0,
                                minWidth: 330,
                                height: 50,
                                textColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                child: const Text(
                                  "GİRİŞ YAP",
                                  style: TextStyle(
                                    color: loginpurple,
                                    fontSize: 18,
                                    fontFamily: 'Raleway',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Row(mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 30),
                                  child: RichText(text:const TextSpan(
                                            text: "Bir hesabınız yok mu ?   ",
                                            style: TextStyle(
                                                fontFamily: 'Cormorant Garamond',
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600)), ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 30),
                                  child: Center(
                                    child: TextButton(
                                        onPressed: () {},
                                        child: const Text(
                                          "Üye Ol",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontFamily: 'Cormorant Garamond',
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold),
                                        )),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              // children: [

                              // ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class BorderStyle {
  static const borderContainer = OutlineInputBorder(
      borderSide: BorderSide(color: loginpurple, width: 2.5),
      borderRadius: BorderRadius.all(Radius.circular(30)));
}
