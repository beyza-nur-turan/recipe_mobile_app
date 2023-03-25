import 'package:flutter/material.dart';
import '../demointro.dart';
class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(width: MediaQuery.of(context).size.width * 1,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        
        Color.fromARGB(255, 225, 232, 234),
        Color.fromARGB(255, 143, 134, 210),
      ],
    ),
                image: DecorationImage(
                    image: AssetImage("assets/lottie/output-onlinegiftools (4).gif"),
                    fit: BoxFit.fitWidth)),),);
  }
}