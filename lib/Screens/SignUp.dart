import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:loginn/constants.dart';
import 'package:loginn/core/config/app_router.gr.dart';
import 'package:loginn/main.dart';
import 'package:loginn/auth/Auth.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../widgets/textSignupWidget.dart';

class SignUp extends StatefulWidget {
  static const String routeName = '/signup';
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _firestore = FirebaseFirestore.instance;
  //final FocusNode _emailFocusNode = FocusNode();
   TextEditingController emailController = TextEditingController();
   TextEditingController passwordController = TextEditingController();
   TextEditingController nameController = TextEditingController();
   TextEditingController phoneController = TextEditingController();
   String uid = FirebaseAuth.instance.currentUser!.uid;
    bool obscure_text =true;
    bool Obscure_text=false;
   signUpUser() async {
    _firestore.collection("users").doc(uid).set({
      "ad-soyad": nameController.text,
      "e-mail": emailController.text,
      "telefon": phoneController.text,
      "şifre": passwordController.text
    });
    context.read<FirebaseAuthMethods>().signUpWithEmail(
          email: emailController.text,
          password: passwordController.text,
          context: context,
        );
        
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference userRef = _firestore.collection("users");
    Size size = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: () async {
        router.push(const Demointro());
        return false;
      },
      child: Container(
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
                child: ClipOval(
                    child: Image.asset(
                        'assets/lottie/output-onlinegiftools (5).gif')),
              ),
              SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.only(top: 75),
                  padding: EdgeInsets.only(top: size.height * 0.25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 40, right: 40),
                        child: Column(
                          children: [
                             TextSignupWidget(obscure_text:Obscure_text,
                              keyboardTYpe: TextInputType.text,
                              upText: "Ad Soyad",
                              iconUp: Icons.person,
                              controllerUp: null,
                            ),
                            TextSignupWidget(obscure_text: Obscure_text,
                              keyboardTYpe: TextInputType.emailAddress,
                              //FocusNode:_emailFocusNode ,
                              upText: "E-Mail",
                              iconUp: Icons.mail,
                              controllerUp: emailController,
                            ),
                             TextSignupWidget(obscure_text: Obscure_text, keyboardTYpe: TextInputType.phone,
                              upText: "Telefon",
                              iconUp: Icons.phone,
                              controllerUp: null,
                            ),
                            TextSignupWidget(obscure_text: obscure_text, keyboardTYpe: TextInputType.text,
                              upText: "Şifre",
                              iconUp: Icons.lock,
                              suffixIcon: IconButton(
                                  onPressed: (){setState(() {
                                obscure_text=!obscure_text;
                              });}, icon: Icon(obscure_text ? Icons.visibility_off :Icons.visibility),),
                              controllerUp: passwordController,
                            
                            ),
                            
                            
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 110, top: 10),
                        padding: const EdgeInsets.only(left: 40, right: 40),
                        decoration: BoxDecoration(
                          border: Border.all(color: usePurple),
                          color: const Color.fromARGB(255, 34, 33, 34),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: TextButton(
                            onPressed:signUpUser,
                            child: const Text(
                              "Üye Ol",
                              style: TextStyle(
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
      ),
    );
  }
  //bu override metodunda mail inputuna tıkladığımızda texte yazdırdığımız yazı otomatik olarak geliyor
  //  @override
  // void initState() {
  //   super.initState();
  //   _emailFocusNode.addListener(() {
  //     if (_emailFocusNode.hasFocus) {
  //       emailController.value = TextEditingValue(
  //         text: '@gmail.com',
  //         selection: TextSelection.collapsed(offset: emailController.text.length),
  //       );
  //     }
  //   });
  // }
}
