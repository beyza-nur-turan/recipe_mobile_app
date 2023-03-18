import 'package:flutter/material.dart';
import 'package:loginn/constants.dart';

class TextFormFieldWidget extends StatelessWidget {
   final String deger;
   final IconData icon;
   final IconButton? suffixIcon;
   final Color? sufIconColor;
   final TextEditingController controller;
   
  const TextFormFieldWidget({
    super.key, required this.deger, required this.icon, this.suffixIcon, this.sufIconColor, required this.controller,
  });
 

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(
          color: Colors.black, fontFamily: 'Raleway'),
      decoration:  InputDecoration(
          enabledBorder: BorderStyle.borderContainer,
          fillColor: loginpurple,
          labelText: deger,
          prefixIcon: Icon(icon),
          prefixIconColor: siyah,
          suffixIcon: suffixIcon,
          suffixIconColor: sufIconColor,
          labelStyle:const TextStyle(fontSize: 16)),
    );
  }
}
class BorderStyle {
  static const borderContainer = OutlineInputBorder(
      borderSide: BorderSide(color: loginpurple, width: 2.5),
      borderRadius: BorderRadius.all(Radius.circular(30)));
}