import 'package:flutter/material.dart';
import 'package:loginn/constants.dart';
import 'package:loginn/core/config/app_router.gr.dart';
import 'package:loginn/main.dart';

class Demointro extends StatelessWidget {
  const Demointro({super.key});
  // final imageUrl =
  //     'https://images.pexels.com/photos/3338497/pexels-photo-3338497.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1';
  final login = "GİRİŞ YAP";
  final signIn = "KAYIT OL";
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
        Color.fromARGB(255, 255, 255, 255),
        Color.fromARGB(255, 220, 216, 221),
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
                        padding: const EdgeInsets.only(top: 40),
                        child: MaterialButton(
                          onPressed: () {
                            router.push(const SignIn());
                          },
                          color:const Color.fromARGB(255, 27, 27, 27),
                          elevation: 0,
                          minWidth: 150,
                          height: 50,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
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
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 99),
                  child: MaterialButton(
                    onPressed: () {
                      router.push(const SignUp());
                    },
                    color:const Color.fromARGB(255, 27, 27, 27),
                    elevation: 0,
                    minWidth: 150,
                    height: 50,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: const Text(
                      "KAYIT OL",
                      style: TextStyle(
                        color: loginpurple,
                        fontSize: 18,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            )));
  }
}
