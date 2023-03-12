import 'package:flutter/material.dart';
import 'package:loginn/constants.dart';
import 'package:loginn/widgets/textSignupWidget.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key, });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/register.jpg'), fit: BoxFit.cover),
            
      ),
      
      child: Scaffold(resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Stack(
          children: [
            Container(
              width: 220,height: 180,color: Colors.transparent,
               
                child: ClipOval(
                          child: Image.asset('assets/images/22.png')),
              
        ),
              
            
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(top: size.height * 0.25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 40, right: 40),
                      child: Column(
                        children:const [
                          textSignupWidget(upText:"Ad Soyad", iconUp: Icons.person ,),
                          textSignupWidget(upText: "Kullanıcı Adı", iconUp: Icons.person_2_outlined,),
                          textSignupWidget(upText: "Şifre", iconUp: Icons.lock,),
                          textSignupWidget(upText: "E-Mail", iconUp: Icons.mail,),
                          
                        ],
                      ),
                    ),
                     
                          Padding(
                                  padding: const EdgeInsets.only(top: 30),
                                  child: Center(
                                    child: TextButton(
                                        onPressed: () {},
                                        child: const Text(
                                          "Üye Ol",
                                          style: TextStyle(
                                              fontSize: 27,
                                              color: siyah,
                                              fontWeight: FontWeight.bold),
                                        )),
                                  ),
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