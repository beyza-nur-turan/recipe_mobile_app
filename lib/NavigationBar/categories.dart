import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loginn/constants.dart';
import 'meals_by_categories.dart';
import 'package:firebase_core/firebase_core.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});
  void main() async {
    // Firebase'i başlat
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    Future<List<dynamic>> fetchCategories() async {
      final categories =
          await FirebaseFirestore.instance.collection('categories').get();

      return categories.docs.map((doc) => doc.data()).toList();
    }

    Future<List<dynamic>> fetchMealsByCategory(String category_name) async {
      final meals = await FirebaseFirestore.instance
          .collection('recipe')
          .where('category_name', isEqualTo: category_name)
          .get();

      return meals.docs.map((doc) => doc.data()).toList();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: usePurple,
        title: const Text('Damaktaki Tatların Kategorileri'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: fetchCategories(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                final category = snapshot.data![index];
                return Card(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MealsByCategory(
                            category: category["category_name"],
                          ),
                        ),
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Image.network(
  category['category_photo'],
  height: 200,
  fit: BoxFit.cover,
  errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
    return Text('Resim yüklenemedi: $exception');
  },
)
,
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            category['category_name'],
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error}'),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
