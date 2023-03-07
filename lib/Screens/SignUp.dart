import 'package:flutter/material.dart';
import 'package:loginn/constants.dart';
import 'package:loginn/widgets/textwidget.dart';

class SignUp extends StatelessWidget {
  final String label_text;
  const SignUp({super.key, required this.label_text});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(resizeToAvoidBottomInset: false,
    body: Center(
      child: Container(
          width: size.width * 1,
          decoration: const BoxDecoration(
              gradient:
                  LinearGradient(colors: [Color(0xfff5ebe0), Color(0xff6818a5)])),
          child: SizedBox(
              width: size.width * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Field(
                    label_text: "Ad soyad",
                    icon: Icons.person_pin,
                  ),
                  const Field(
                    label_text: "Kullanıcı adı",
                    icon: Icons.person,
                  ),
                  const Field(
                    label_text: "Şifre",
                    icon: Icons.lock,
                  ),
                  const Field(
                    label_text: "E-Mail",
                    icon: Icons.mail,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: SizedBox(
                      width: size.width * 0.7,
                      height: size.height * 0.07,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  side: const BorderSide(color: darkPurple,width: 2),
                                  borderRadius: BorderRadius.circular(15)),
                              backgroundColor: Colors.white),
                          onPressed: () {},
                          child: const Text(
                            "ÜYE OL",
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 20,fontWeight:FontWeight.bold
                            ),
                          )),
                    ),
                  )
                ],
              ))),
    ));
  }
}


// child: Column(mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                // children: const[TextField(
                //         style: TextStyle(
                //           fontSize: 16,
                //           color: Colors.white,
                //         ),
                //         obscureText: true,//girilen karakterler gözükmeyecek
                //         obscuringCharacter: '*',//girilen karakterin nasıl gizleneceği
                //         cursorColor: Colors.black,//TextField içerisindeki cursorun rengi

                //         decoration: InputDecoration(
                //           labelText: "Şifrenizi Giriniz",//TextField içerisinde istediğimiz bir metni yazabiliriz
                //           labelStyle: TextStyle(color: Colors.black),//label textinin tasarımı
                //           border: OutlineInputBorder(),//TextField için kenarları yuvarlak bir bordür
                //           fillColor: Colors.white,//TextField içerisinin rengi
                //           filled: true,//TextField içerisinin rengi olsunmu? Evet dedik],),
                //     ),),

                //   ]),