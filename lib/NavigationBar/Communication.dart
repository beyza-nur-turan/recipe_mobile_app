import 'package:flutter/material.dart';
import 'package:loginn/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
class Communication extends StatelessWidget {
  const Communication({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor:  Colors.white,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border: Border.all(
                color: const Color.fromARGB(255, 18, 29, 144),
                width: 3.0,
              ),
            ),
            child: const CircleAvatar(
              backgroundImage: AssetImage(
                  'assets/images/pexels-jill-wellington-3776950.jpg'),
              radius: 65,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Nefis Tarifler",
            style: TextStyle(
                color: Color.fromARGB(255, 24, 32, 112), fontSize: 28),
          ),
          const Text(
            "Damaktaki Nefis Tat",
            style: TextStyle(
                fontSize: 15,
                color: Color.fromARGB(255, 49, 57, 145),
                fontFamily: "lobster"),
          ),
          const SizedBox(
            height: 70,
          ),
          Container(
            width: size.width * 0.95,
            height: size.height * 0.075,
            child: Card(
              color: usePurple,
              child: Row(
                children:  [
                const  SizedBox(
                    width: 20,
                  ),
                  SvgPicture.asset(
                    "assets/icons/mail.svg",
                    width: size.width * 0.07,
                    color: Color.fromARGB(255, 49, 57, 145),
                  ),
                 const SizedBox(
                    width: 20,
                  ),
                const Text(
                    "nefistarifler@gmail.com",
                    style: TextStyle(
                        fontSize: 20,
                        color:Colors.white),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Container(
            width: size.width * 0.95,
            height: size.height * 0.075,
            child: Card(
              color: usePurple,
              child: Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  SvgPicture.asset(
                    "assets/icons/facebook.svg",
                    width: size.width * 0.07,color: Color.fromARGB(255, 49, 57, 145)
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Text(
                    "nefis_tarifler",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Container(
            width: size.width * 0.95,
            height: size.height * 0.075,
            child: Card(
              color: usePurple,
              child: Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  SvgPicture.asset(
                    "assets/icons/instagram.svg",
                    width: size.width * 0.07,
                    color: Color.fromARGB(255, 49, 57, 145),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Text(
                    "nefis_tarifler",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white),
                  )
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
