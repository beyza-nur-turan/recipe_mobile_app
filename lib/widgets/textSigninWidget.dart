import 'package:flutter/material.dart';
import 'package:loginn/constants.dart';

class TextFormFieldWidget extends StatelessWidget {
   final String deger;
   final IconData icon;
   final IconButton? suffixIcon;
   final Color? sufIconColor;
   final TextEditingController controller;
   final bool obscureText;
  const TextFormFieldWidget({
    super.key, required this.deger, required this.icon, this.suffixIcon, this.sufIconColor, required this.controller, required this.obscureText,
  });
 
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      style: const TextStyle(
          color: Colors.black, fontFamily: 'Raleway'),
      decoration:  InputDecoration(
          enabledBorder: BorderStyle.borderContainer,
          fillColor: usePurple,
          labelText: deger,
          prefixIcon: Icon(icon),
          prefixIconColor: siyah,
          suffixIcon: suffixIcon,
          suffixIconColor: sufIconColor,floatingLabelStyle:const TextStyle(color: iconDarkColor,fontWeight:FontWeight.normal,fontSize: 16),
          focusedBorder:const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(27)),
              borderSide:  BorderSide(
                color: usePurple,
              ),
            ),
          labelStyle:const TextStyle(fontSize: 16)),
    );
  }
}
class BorderStyle {
  static const borderContainer = OutlineInputBorder(
      borderSide: BorderSide(color: usePurple, width: 2.5),
      borderRadius: BorderRadius.all(Radius.circular(30)));
}