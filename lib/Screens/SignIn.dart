import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:loginn/constants.dart';
import 'package:loginn/widgets/textSigninWidget.dart';
import 'package:loginn/core/config/app_router.gr.dart';
import '../main.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
   //String _email, _password;
  final FirebaseAuth auth = FirebaseAuth.instance;
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
                width: MediaQuery.of(context).size.width*0.50,
                height: MediaQuery.of(context).size.height*0.27,
                color: Colors.transparent,
                child: ClipOval(child: Image.asset('assets/images/Nefis_Tarifler__6_-removebg-preview.png')),
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
                                        onPressed: () {router.push(const SignUp());},
                                        child: const Text(
                                          "Üye Ol",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontFamily: 'Cormorant Garamond',
                                              color: altbutton,
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