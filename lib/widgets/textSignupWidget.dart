import 'package:flutter/material.dart';
import 'package:loginn/constants.dart';
class textSignupWidget extends StatelessWidget {
  final String upText;
  final IconData iconUp;
  const textSignupWidget({
    super.key, required this.upText, required this.iconUp,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:10,bottom: 20),
      child: TextField(
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
             enabledBorder: BorderStyle.borderContainer,
             fillColor: darkPurple,
            labelText: upText,
            labelStyle: const TextStyle(color: Colors.black),
            prefixIcon: Icon(iconUp),
            iconColor: siyah,
            focusedBorder:const OutlineInputBorder(
              borderSide:  BorderSide(
                color: Colors.black,
              ),
            ),
            
            ),
      ),
    );
  }
}
class BorderStyle {
  static const borderContainer = OutlineInputBorder(
      borderSide: BorderSide(color: siyah, width: 2.5),
      borderRadius: BorderRadius.all(Radius.circular(30)));
}