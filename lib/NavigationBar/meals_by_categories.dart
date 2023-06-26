import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:loginn/constants.dart';

import 'meal_details.dart';

class MealsByCategory extends StatefulWidget {
  final String category;

  MealsByCategory({required this.category});

  @override
  _MealsByCategoryState createState() => _MealsByCategoryState();
}

class _MealsByCategoryState extends State<MealsByCategory> {
   Future<List<dynamic>> mealsByCategories() async {
  final meals = await FirebaseFirestore.instance.collection('recipe').where("category_name", isEqualTo: widget.category).get();
  return meals.docs.map((doc) => doc.data()).toList();
}

  final CollectionReference categoryCollection1 =
      FirebaseFirestore.instance.collection('categories');
  final CollectionReference categoryCollection2 =
      FirebaseFirestore.instance.collection('recipe');

  List<DocumentSnapshot> categoryDataList = [];

  Future<List<DocumentSnapshot>> getCategoryData(String category) async {
    QuerySnapshot querySnapshot = await categoryCollection2
        .where("category_name", isEqualTo: category)
        .get();
    return querySnapshot.docs;
  }

  @override
  void initState() {
    super.initState();
    getCategoryData(widget.category).then((value) {
      setState(() {
        categoryDataList = value;
      });
    });
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(backgroundColor: Colors.white,
    body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            widget.category,textAlign: TextAlign.center,
            style:const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,color: Color.fromARGB(255, 18, 86, 175)
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: categoryDataList.length,
            itemBuilder: (BuildContext context, int index) {
              return FutureBuilder<List<dynamic>>(
                future: mealsByCategories(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final details = snapshot.data?[index];
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MealDetails(
                              details: snapshot.data?[index],
                            ),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Card(elevation: 5,color: Color.fromARGB(255, 244, 240, 248),//0xfffbfaff
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
      height: 100, // ListTile yüksekliği
      child: Row(
        children: [
          Image.network(
            details["image_url"],
            width: 120, // Resim genişliği
          ),
          SizedBox(width: 10), // Resim ile başlık arasındaki boşluk
          Expanded(
            child: Text(
               details["recipeTitle"],
              style: TextStyle(fontSize: 18,color: usePurple,fontWeight: FontWeight.w400), // Başlık boyutu
            ),
          ),
        ],
      ),
    )
                          ),
                        ),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text('Bir hata oluştu.');
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              );
            },
          ),
        ),
      ],
    ),
  );
}

}
