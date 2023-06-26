import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';

class MealDetails extends StatefulWidget {
  final Map<String, dynamic> details;
  MealDetails({required this.details, });

  @override
  _MealDetailsState createState() => _MealDetailsState();
}

class _MealDetailsState extends State<MealDetails> {
  String? recipeTitle;

  @override
  void initState() {
    super.initState();
    _getRecipeDetails();
  }

  Future<void> _getRecipeDetails() async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final CollectionReference recipesCollection =
        firestore.collection('recipes');

    DocumentSnapshot recipeDoc =
        await recipesCollection.doc(widget.details['recipeTitle']).get();
    if (recipeDoc.exists) {
      setState(() {
        recipeTitle = recipeDoc['recipeTitle'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(backgroundColor: Colors.white,
      body: ListView(shrinkWrap: true, children: [
        
          
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Image(
                fit: BoxFit.cover,
                width: size.width * 1,
                height: size.height * 0.4,
                image: NetworkImage(widget.details['image_url']),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15,bottom: 10),
              child: Text(widget.details['recipeTitle'],textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 28,fontWeight: FontWeight.bold,
                    color: usePurple,
                  )),
            ),
            if (recipeTitle != null) Text(recipeTitle!),
            Card(
              elevation: 6,
              margin: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            widget.details['cooking'],
                            style: const TextStyle(
                                fontSize: 20,
                                color: usePurple,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        const SizedBox(height: 10),
                          const Text(
                            "Pişirme",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromARGB(255, 83, 82, 82),
                                fontWeight: FontWeight.w400,
                                fontSize: 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            widget.details['preparation'],
                            style: const TextStyle(
                                fontSize: 20,
                                color: usePurple,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 10),
                          const Text("Hazırlama",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 83, 82, 82),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16),
                              textAlign: TextAlign.center),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            widget.details['forHowManyPerson'],
                            style: const TextStyle(
                                fontSize: 20,
                                color: usePurple,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 10),
                          const Text("Kaç Kişilik",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 83, 82, 82),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16),
                              textAlign: TextAlign.center),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Card(color:const Color.fromARGB(255, 254, 253, 255),
                   child: Padding(
                     padding: const EdgeInsets.only(left: 16,top: 8,bottom: 10,right: 16),
                     child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      const Text(
                        "Malzemeler",
                        style: TextStyle(
                            fontSize: 24,
                            color: usePurple,
                            fontWeight: FontWeight.bold),
                      ),const SizedBox(height: 10,),
                      Text(
                        widget.details['materials'],
                        style: const TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 56, 55, 55),
                        ),
                      ),
                                 ],
                               ),
                   ),
                 ),
               ),const SizedBox(height: 15,),
                Padding(
                padding: const EdgeInsets.only(left: 12,right: 12),
           child: Card(color:const Color.fromARGB(255, 245, 238, 252),elevation: 6,
              
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      const Text(
                        "Püf Noktası !!!",
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 39, 38, 38),
                            fontWeight: FontWeight.bold),
                      ),const SizedBox(height: 10,),
                      Text(
                        widget.details['cookingTips'],
                        style: const TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 56, 55, 55),
                        ),
                      ),
                    ]),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(color:Color.fromARGB(255, 254, 253, 255),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          const Text(
                            "Nasıl Yapılır ?",
                            style: TextStyle(
                                fontSize: 24,
                                color: Color.fromARGB(255, 39, 38, 38),
                                fontWeight: FontWeight.bold),
                          ),const SizedBox(height: 10,),
                          Text(
                            widget.details['cookingStep'],
                            style: const TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 56, 55, 55),
                            ),
                          ),
                        ]),
                ),
              ),
            ),
          ],
        
      ),
    );
  }
}
