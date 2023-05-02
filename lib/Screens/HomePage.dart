import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:loginn/constants.dart';
import 'package:loginn/main.dart';
import '../NavigationBar/Communication.dart';
import '../NavigationBar/MakeMenu.dart';
import 'addRecipe.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
     Future<List<Object?>> getRecipe() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('recipe').get();
    final List<DocumentSnapshot> documents = snapshot.docs;
    return documents.map((doc) => doc.data()).toList();
  }

    return Scaffold(drawer: MakeMenu(),appBar: AppBar(backgroundColor: usePurple ,actions: [
   IconButton(
            onPressed: () {
              
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      
         body: FutureBuilder(
      future: getRecipe(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Veriler alınamadı.'),
            );
          } else {
            final eats = snapshot.data;
            return ListView.builder(
              itemCount: eats.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(color: usePurple,
                  child: Column(
                    children: [
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const Communication()));
                            },
                            child: Card(
                             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              
                                child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: cardbg),width: size.width*1,
                                  child: Column(
                                    children: <Widget>[
                                      Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: cardbg),
                                        padding: const EdgeInsets.only(top: 15),
                                        child: Image(
                                          fit: BoxFit.cover,
                                          width: size.width * 0.9,
                                          height: size.height * 0.2,
                                          image: NetworkImage(eats[index]['image_url']),
                                        ),
                                      ),
                                      Text(
                                        eats[index]['recipeTitle'],
                                        style: const TextStyle(
                                          fontSize: 20,
                                          color: registerpurple,
                                        ),
                                      ),
                                      Text(eats[index]['cooking']),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          
                        ],
                      ),
                      
                    ],
                    
                  ),
                );
              },
            );
          }
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    ));
    
  }
}
class TextStyles{
  static const testStyle=TextStyle(fontWeight: FontWeight.w900,color: usePurple,fontSize: 16);
}