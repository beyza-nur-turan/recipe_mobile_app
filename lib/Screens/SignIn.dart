import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:loginn/Screens/HomePage.dart';
import 'package:loginn/constants.dart';
import 'package:loginn/widgets/textSigninWidget.dart';
import 'package:loginn/core/config/app_router.gr.dart';
import 'package:provider/provider.dart';
import '../auth/Auth.dart';
import '../main.dart';
import 'package:loginn/Screens/HomePage.dart';


class SignIn extends StatefulWidget {
  static  String routeName= '/login';
  const SignIn({super.key});
  @override
  State<SignIn> createState() => _SignInState();
}


class _SignInState extends State<SignIn> {
   final TextEditingController emailController = TextEditingController();
   final TextEditingController passwordController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;
  void loginUser() {
    context.read<FirebaseAuthMethods>().loginWithEmail(
          email: emailController.text,
          password: passwordController.text,
          context: context,
        );
  }
  
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
                             TextFormFieldWidget(controller: emailController,
                                deger: "E-Mail", icon: Icons.person ,),
                            const SizedBox(
                              height: 30,
                            ),
                             TextFormFieldWidget(controller: passwordController,
                              deger: "Şifre",
                              icon: Icons.lock,
                              suffixIcon: IconButton(onPressed: (){}, icon:const Icon(Icons.visibility)),
                              sufIconColor: siyah,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 40),
                              child: MaterialButton(
                                onPressed: () async {loginUser;final auth = FirebaseAuth.instance;
              try {
                final UserCredential userCredential = await auth.signInWithEmailAndPassword(
                  email: emailController.text,
                        password: passwordController.text,
                );
                if (userCredential.user != null) {
                  // Kullanıcı oturum açtı, ana sayfaya yönlendirin
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                }

              } 
              on FirebaseAuthException catch (e) {
                final alert=e.code;
                
//    showDialog(
//   context: context,
//   builder: (BuildContext context) {
//     return AlertDialog(
//       title:const Text('Uyarı!'),
//       content: Text(alert),
//       actions: <Widget>[
//         ElevatedButton(
//           child:const Text('Kapat'),
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),
//       ],
//     );
//   },
// );

  
                if (alert == 'user-not-found') {
                   showDialog(
  context: context,
  builder: (BuildContext context) {
    return AlertDialog(
      title:const Text('Uyarı!'),
      content: Text("Bir hata oluştu: ${e.message}"),
      actions: <Widget>[
        ElevatedButton(
          child:const Text('Kapat'),
          onPressed: () {localization.translate('tr');
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  },
);
                } else if (alert == 'wrong-password') {
                   showDialog(
  context: context,
  builder: (BuildContext context) {
    return AlertDialog(
      title:const Text('Uyarı!'),
      content:const Text("Girilen şifre hatalı"),
      actions: <Widget>[
        ElevatedButton(
          child:const Text('Kapat'),
          onPressed: () {localization.translate('tr');
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  },
);
                }
                else if(alert=='invalid-email'){
                   showDialog(
  context: context,
  builder: (BuildContext context) {
    return AlertDialog(
      title:const Text('Uyarı!'),
      content:const Text("Geçersiz mail adresi"),
      actions: <Widget>[
        ElevatedButton(
          child:const Text('Kapat'),
          onPressed: () {localization.translate('tr');
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  },
);
                }
                
              }
              },
                                
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