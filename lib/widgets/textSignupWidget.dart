import 'package:flutter/material.dart';
import 'package:loginn/constants.dart';
class textSignupWidget extends StatelessWidget {
  final String upText;
  final IconData iconUp;
   final TextEditingController? controllerUp;
  const textSignupWidget({
    super.key, required this.upText, required this.iconUp, this.controllerUp,
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
      borderSide: BorderSide(color: loginpurple, width: 2.5),
      borderRadius: BorderRadius.all(Radius.circular(27)));
}