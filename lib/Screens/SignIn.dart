// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:loginn/constants.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration:const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/sonn.png'),
              fit: BoxFit.scaleDown,
              alignment: Alignment.topCenter
            )
          ),
        ),
        
        Container(
          
          width: MediaQuery.of(context).size.width,
          margin:const EdgeInsets.only(top:320 ),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0),topRight: Radius.circular(15.0)),
            color: Colors.white,
            // gradient:  LinearGradient(colors: [Color(0xfffffafa),Color(0xff836fff)]),
          ),
          child: Padding(
            padding:const EdgeInsets.all(20),
            child: ListView(
              children: <Widget>[
                Padding(
                  padding:const EdgeInsets.fromLTRB(0, 20, 0, 30),
                  child: Container(
                    color:const Color(0xfff5f5f5),
                    child: TextFormField(
                      style:const TextStyle(
                        color: Colors.black,
                        fontFamily: 'Raleway'
                      ),
                      decoration:const InputDecoration(
                        border:BorderStyle.borderContainer,
                        labelText: 'E-Mail',
                        prefixIcon: Icon(Icons.person),prefixIconColor: kPrimaryColor,
                        labelStyle: TextStyle(
                          fontSize: 16
                        )
                      ),
                    ),
                  ),
                ),
                Container(
                  color:const Color(0xfff5f5f5),
                  child: TextFormField(
                    obscureText: true,
                    obscuringCharacter: "*",
                    cursorColor: kPrimaryColor,
                    style:const TextStyle(
                      color: Colors.black,
                      fontFamily: 'Raleway'
                    ),
                    decoration:const InputDecoration(
                      border: BorderStyle.borderContainer,
                      labelText: 'Şifre',
                      prefixIcon: Icon(Icons.lock),
                      prefixIconColor: kPrimaryColor,
                      suffixIcon: Icon(Icons.visibility),
                      suffixIconColor: kPrimaryColor,
                      labelStyle: TextStyle(
                          fontSize: 16
                        )
                    ),
                  ),
                ),
                Padding(
                  padding:const EdgeInsets.only(top: 40),
                  child: MaterialButton(
                    onPressed: (){},
                    
                    color: kPrimaryColor,
                    elevation: 0,
                    minWidth: 400,
                    height: 50,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child:const Text("GİRİŞ YAP",
                    style: TextStyle(
                       fontSize: 16,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Center(
                    child: Text('Şifremi unuttum',
                    style: TextStyle( 
                      fontFamily: 'Raleway',
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                    ),
                    ),
                  ),
                ),
                Padding(
                  padding:const EdgeInsets.only(top: 30),
                  child: Center(
                    child: RichText(
                      text:const TextSpan(
                        children: [
                          TextSpan(
                            text: "Bir hesabınız yok mu ?   ",
                            style: TextStyle(
                              fontFamily: 'Raleway',
                              color: Colors.black,
                              fontSize: 15,
                            )
                          ),
                          TextSpan(
                            
                            text: "Üye ol",
                            style: TextStyle(
                              fontFamily: 'Raleway',
                              color: kPrimaryColor,
                              fontSize: 15,
                            )
                          )
                        ]
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
class BorderStyle{
  static const borderContainer=OutlineInputBorder(borderSide:BorderSide(color: kPrimaryColor),borderRadius: BorderRadius.all(Radius.circular(10.0)));
}