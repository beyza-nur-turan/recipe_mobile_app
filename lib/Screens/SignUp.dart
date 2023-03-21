import 'package:flutter/material.dart';
import 'package:loginn/constants.dart';
import 'package:loginn/core/config/app_router.gr.dart';
import 'package:loginn/main.dart';
import 'package:loginn/widgets/textSignupWidget.dart';
import 'package:loginn/auth/Auth.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  static const String routeName = '/signup';
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void signUpUser() async {
    context.read<FirebaseAuthMethods>().signUpWithEmail(
          email: emailController.text,
          password: passwordController.text,
          context: context,
        );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/login.jpg'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 60, bottom: 520),
              width: MediaQuery.of(context).size.width * 0.4,
              height: MediaQuery.of(context).size.height * 0.27,
              color: Colors.transparent,
              child: ClipOval(child: Image.asset('assets/images/Nefis_Tarifler__6_-removebg-preview.png')),
            ),
            SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.only(top: 45),
                padding: EdgeInsets.only(top: size.height * 0.25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 40, right: 40),
                      child: Column(
                        children: [
                          const textSignupWidget(
                            upText: "Ad Soyad",
                            iconUp: Icons.person,
                            controllerUp: null,
                          ),
                          textSignupWidget(
                            upText: "Şifre",
                            iconUp: Icons.lock,
                            suffixIcon: IconButton(onPressed: (){}, icon:const Icon(Icons.visibility,color: Colors.black,) ),
                            controllerUp: passwordController,
                          ),
                          const textSignupWidget(
                            upText: "Telefon",
                            iconUp: Icons.phone,
                            controllerUp: null,
                          ),
                          textSignupWidget(
                            upText: "E-Mail",
                            iconUp: Icons.mail,
                            controllerUp: emailController,
                          ),
                        ],
                      ),
                    ),
                    Container(margin:const EdgeInsets.only(left:110,top:10 ),
                    padding:const EdgeInsets.only(left: 40,right: 40),
                      decoration: BoxDecoration(
                        border: Border.all(color: usePurple),color:const Color.fromARGB(255, 34, 33, 34),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: TextButton(
                          onPressed: signUpUser,
                          child: const Text(
                            "Üye Ol",
                            style: TextStyle(
                              fontFamily: 'Cormorant Garamond',
                                fontSize: 27,
                                color: usePurple,
                                ),
                          )),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 2),
                          child: RichText(
                            text: const TextSpan(
                                text: "Kaydınız var mı? ?   ",
                                style: TextStyle(
                                    fontFamily: 'Cormorant Garamond',
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 2),
                          child: Center(
                            child: TextButton(
                                onPressed: () {
                                  router.push(const SignIn());
                                },
                                child: const Text(
                                  "Giriş Yap",
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontFamily: 'Cormorant Garamond',
                                      color: usePurple,
                                      fontWeight: FontWeight.bold),
                                )),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
