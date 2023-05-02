import 'package:flutter/material.dart';
import 'package:loginn/constants.dart';
class recipeTextFormField extends StatelessWidget {
  //statefullwidget ta labelText ataması yapamadım????
  final String labelText;
  final int? maxLines;
  final TextEditingController? controllerRecipe;
  const recipeTextFormField(
      {super.key, required this.labelText,  required this.maxLines, required this.controllerRecipe});

  @override
  Widget build(BuildContext context) {
    
    return Container(margin:const EdgeInsets.only(left: 1),
    width: MediaQuery.of(context).size.width*0.85,
    height:MediaQuery.of(context).size.height*0.1 ,
      
        child: 
          TextFormField(maxLines: maxLines,
          controller: controllerRecipe,
            decoration: InputDecoration( enabledBorder:const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide:  BorderSide(width: 1.5,
                color: usePurple,
              ),),
              labelText: labelText,
              labelStyle: const TextStyle(color: Colors.black),
              focusedBorder:const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              borderSide:  BorderSide(width: 2.5,
                color: usePurple
              ),
            ),
            ),
          )
        
      
    );
  }
}
