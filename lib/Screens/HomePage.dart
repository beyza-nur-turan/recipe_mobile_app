import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:loginn/NavigationBar/categories.dart';
import 'package:loginn/NavigationBar/meal_details.dart';
import 'package:loginn/Screens/addRecipe.dart';
import 'package:loginn/constants.dart';
import '../NavigationBar/Communication.dart';
import '../NavigationBar/MakeMenu.dart';
import 'package:http/http.dart' as http;
import '../NavigationBar/Missing.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  Future<Map<String, dynamic>> searchRecipes(String query) async {
    // burda mealdb den veri çekiyoruz.
    String url = "https://www.themealdb.com/api/json/v1/1/search.php?s=$query";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      //API'dan dönen verileri alıyoruz
      final Map<String, dynamic> responseData = json.decode(response.body);
      return responseData;
    } else {
      throw Exception('Veri yüklenemedi!');
    }
  }
  late TextEditingController recipeTitleController;
  @override
  void initState() {
    super.initState();
    recipeTitleController = TextEditingController();
  }
  @override
  void dispose() {
    recipeTitleController.dispose();
    super.dispose();
  }
  void checkRecipeTitle(BuildContext context) async {
    try {
      String title = recipeTitleController.text;
      QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
          .instance
          .collection('recipe')
          .where('recipeTitle', isEqualTo: title)
          .get();
      if (snapshot.docs.isNotEmpty) {
        final recipeTitle =
            snapshot.docs[0].data();//aradığımızda çıkan ilk değeri temsilen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MealDetails(
              details: recipeTitle,
            ),
          ),
        );
        
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Tarif Bulunamadı'),
              content: Text('Girilen tarif mevcut değil.'),
              actions: <Widget>[
                TextButton(
                  child: Text('Tamam'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    } catch (error) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title:const Text('Hata'),
            content: Text('Bir hata oluştu: $error'),
            actions: <Widget>[
              TextButton(
                child:const Text('Tamam'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Future<List<Object?>> getRecipe() async {
      final snapshot =
          await FirebaseFirestore.instance.collection('recipe').get();
      final List<DocumentSnapshot> documents = snapshot.docs;
      return documents.map((doc) => doc.data()).toList();
    }
    return Scaffold(
        drawer: MakeMenu(),
        appBar: AppBar(
          backgroundColor: usePurple,
          centerTitle: true,
          title: Text("NEFİS TARİFLER",style: TextStyle(color: Colors.white70),),
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Stack(
              children: [
                Image.network(
                  'https://images.pexels.com/photos/238306/pexels-photo-238306.jpeg?auto=compress&cs=tinysrgb&w=600',
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 10,
                  left: 16,
                  right: 16,
                  child: TextFormField(
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                        focusColor: usePurple,
                        filled: true,
                        fillColor: Colors.transparent,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        hintText: 'Tarif arayın',
                        suffixIcon: IconButton(
                            icon: const Icon(Icons.search),
                            onPressed: () {
                              checkRecipeTitle(context);
                            })),
                  ),
                ),
              ],
            ),
            const Text(
              'Tavuk Tarifleri',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 24, color: usePurple, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 150.0,
              child: FutureBuilder(
                future: searchRecipes("chicken"),
                builder:
                    (context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  } else {
                    final recipeList = snapshot.data!['meals'];
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final recipe = recipeList[index];
                        return Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const Communication()));
                              },
                              child: Card(
                                  elevation: 10,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Container(
                                    padding: const EdgeInsets.only(top: 25),
                                    height: 200,
                                    width: 300,
                                    child: ListTile(
                                      contentPadding: EdgeInsets.zero,
                                      leading: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.network(
                                          recipe['strMealThumb'],
                                          height: 300,
                                          width: 130,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      title: Flexible(
                                        child: Text(
                                          recipe['strMeal'],
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            fontSize: 25.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      subtitle: Flexible(
                                        child: Text(
                                          recipe['strArea'],
                                          textAlign: TextAlign.center,
                                          style:
                                              const TextStyle(fontSize: 16.0),
                                        ),
                                      ),
                                    ),
                                  )),
                            ),
                          ],
                        );
                      },
                      itemCount: recipeList.length,
                    );
                  }
                },
              ),
            ),
            FutureBuilder(
              future: getRecipe(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError){
                    return const Center(
                      child: Text('Veriler alınamadı.'),
                    );
                  } else {
                    final eats = snapshot.data;
                    return SizedBox(
                      height: size.height * 0.26,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: eats.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          const Communication()));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Card(
                                    elevation: 20,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: cardbg),
                                      width: size.width*1,
                                      child: Column(
                                        children: <Widget>[
                                          Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: cardbg),
                                            padding:
                                                const EdgeInsets.only(top: 15),
                                            child: Image(
                                              fit: BoxFit.cover,
                                              width: size.width * 0.9,
                                              height: size.height * 0.2,
                                              image: NetworkImage(
                                                  eats[index]['image_url']),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Text(
                                              eats[index]['recipeTitle'],
                                              style: const TextStyle(
                                                fontSize: 20,
                                                color: registerpurple,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    );
                  }
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            GNav(
              mainAxisAlignment: MainAxisAlignment.center,
              backgroundColor: Colors.white,
              rippleColor: const Color.fromARGB(
                  255, 134, 128, 165), //butona  bastığın an rengin dalgalanması
              hoverColor: const Color.fromARGB(
                  255, 134, 128, 165), //fare üzerine gelince rengin değişmesi
              haptic: true, //geri bildirim
              tabBorderRadius: 32,
              tabActiveBorder:
                  Border.all(color: Colors.white, width: 1), //buton kenarı
              tabBorder:
                  Border.all(color: Colors.white, width: 1), // buton kenarı
              tabShadow: [
                BoxShadow(color: Colors.white.withOpacity(0.5), blurRadius: 8)
              ], //buton gölgesi
              curve: Curves.linear, //animasyon stili
              duration: const Duration(milliseconds: 200), //animasyon süresi
              gap: 8, //simge ve metin arasındaki buton boşluğu
              color: Colors.grey[800],
              activeColor: usePurple, //seçilen simge ve metin rengi
              iconSize: 30, //buton boyutu
              tabBackgroundColor: const Color.fromARGB(255, 148, 119, 173)
                  .withOpacity(0.1), //sekme arka plan rengi
              padding: const EdgeInsets.symmetric(
                  horizontal: 16, vertical: 16), // gezinme çubuğu genişliği
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: 'Ana sayfa',
                  textStyle: TextStyles.testStyle,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                ),
                GButton(
                  icon: Icons.shopping_bag,
                  text: 'Alışveriş Listesi',
                  textStyle: TextStyles.testStyle,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MissingItemsPage()));
                  },
                ),
                GButton(
                  icon: Icons.category,
                  text: 'Kategoriler',
                  textStyle: TextStyles.testStyle,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Categories()));
                  },
                ),
                GButton(
                  icon: Icons.add_chart,
                  text: 'Tarif Ekle',
                  textStyle: TextStyles.testStyle,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => addRecipe()));
                  },
                ),
              ],
            )
          ],
        ));
  }
}

class TextStyles {
  static const testStyle =
      TextStyle(fontWeight: FontWeight.w900, color: usePurple, fontSize: 16);
}
