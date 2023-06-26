import 'package:flutter/material.dart';
import 'package:loginn/Screens/LottieIn.dart';
import 'package:loginn/widgets/FieldButtonWidget.dart';
import 'Screens/LottieUp.dart';

class Demointro extends StatefulWidget {
  const Demointro({super.key});

  @override
  _DemointroState createState() => _DemointroState();
}
class _DemointroState extends State<Demointro> {
  
  
 
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        // Geri tuşuna basıldığında yeni sayfaya gitme
        return false;},
      child: Scaffold(
          body: Container(
              width: MediaQuery.of(context).size.width * 1,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          
          Color.fromARGB(255, 242, 242, 242),
          Color.fromARGB(255, 228, 226, 229),
        ],
      ),
                  image: DecorationImage(
                      image: AssetImage("assets/lottie/output-onlinegiftools (4).gif"),
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
                          child:SizedBox(width: size.width*0.44,height: size.height*0.075,
                            child: FieldButton(
                            
                            onTap: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>const LottieInPage()),
                              );
                            },  text: 'Giriş Yap',
                          ),
                          )
     ,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 99),
                    child: SizedBox(width: size.width*0.44,height: size.height*0.075,
                      child: FieldButton(
                      
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>const LottieUpPage()),
                        );
                      },  text: 'Kayıt Ol',
                    ),
                    ),
                  ),
                ],
              ))),
    );
  }
}


