import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:loginn/constants.dart';

class Field extends StatelessWidget {
  final String label_text;
  final IconData icon;

  const Field({
    super.key,
    required this.label_text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Card(
          elevation: 50,
          shadowColor: Colors.black,
          color: Colors.greenAccent[100],
      margin: const EdgeInsets.all(10.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: TextField(
        decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xffffffff),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: darkPurple,width: 2),
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            labelText: label_text,
            prefixIcon: Icon(icon),
            prefixIconColor: kPrimaryColor),
      ),
    ));
  }
}
