import 'package:flutter/material.dart';
import 'package:loginn/constants.dart';

class recipeTextFormField extends StatelessWidget {
  //statefullwidget ta labelText ataması yapamadım????
  final String labelText;
  final int? maxLines;
  final TextEditingController? controllerRecipe;
  const recipeTextFormField(
      {super.key,
      required this.labelText,
      required this.maxLines,
      required this.controllerRecipe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 22, top: 11, right: 22, bottom: 11),
      child: TextFormField(
          maxLines: maxLines,
          controller: controllerRecipe,
          decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                width: 2,
                color: usePurple,
              ),
            ),
            labelText: labelText,
            labelStyle: const TextStyle(color: Colors.black),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(width: 2.5, color: usePurple),
            ),
          )),
    );
  }
}
