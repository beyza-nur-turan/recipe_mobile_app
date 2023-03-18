import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/login.jpg'),
             fit: BoxFit.cover),
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
                width: MediaQuery.of(context).size.width*0.50,
                height: MediaQuery.of(context).size.height*0.27,
              color: Colors.transparent,
              child: ClipOval(
                  child: Image.asset(
                'assets/images/Nefis_Tarifler__6_-removebg-preview.png',
              )),
            ),
            Container(child:const Text("ana sayfa"),)
          ],
        ),
      ),
    );
  }
}
