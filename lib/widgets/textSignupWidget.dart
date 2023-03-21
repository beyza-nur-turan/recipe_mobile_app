import 'package:flutter/material.dart';
import 'package:loginn/constants.dart';
class textSignupWidget extends StatelessWidget {
  final String upText;
  final IconData iconUp;
   final TextEditingController? controllerUp;
   final IconButton?suffixIcon;
  const textSignupWidget({
    super.key, required this.upText, required this.iconUp, this.controllerUp, this.suffixIcon, 
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.only(left: 10),
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width*0.75,
      height: MediaQuery.of(context).size.height*0.110,
      child: TextFormField(
        controller: controllerUp,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
             enabledBorder: BorderStyle.borderContainer,
             fillColor: darkPurple,
            labelText: upText,
            labelStyle: const TextStyle(color: Colors.black),
            prefixIcon: Icon(iconUp),
            prefixIconColor: siyah,
            suffixIcon: suffixIcon,
            focusedBorder:const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(27)),
              borderSide:  BorderSide(
                color: usePurple,
              ),
            ),
            
            ),
      ),
    );
  }
}
class BorderStyle {
  static const borderContainer = OutlineInputBorder(
      borderSide: BorderSide(color: usePurple, width: 2.5),
      borderRadius: BorderRadius.all(Radius.circular(27)));
}