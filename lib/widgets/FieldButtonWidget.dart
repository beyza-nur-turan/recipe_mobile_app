import 'package:flutter/material.dart';
import 'package:loginn/Screens/SignIn.dart';
import 'package:loginn/constants.dart';

import '../main.dart';
class FieldButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const FieldButton({
    super.key, required this.text, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      color:const Color.fromARGB(255, 27, 27, 27),
      elevation: 0,
      minWidth: 150,
      height: 50,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)),
      child: Text(text,style:const TextStyle(
          color: loginpurple,
          fontSize: 18,
          fontFamily: 'Raleway',
          fontWeight: FontWeight.bold,
        ),)
        
        
      );
    
  }
}