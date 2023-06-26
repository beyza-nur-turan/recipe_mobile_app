import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loginn/Screens/RecipeHome.dart';
import 'package:loginn/Screens/addRecipe.dart';
import 'package:loginn/constants.dart';
import 'package:loginn/core/config/app_router.gr.dart';
import 'package:loginn/main.dart';
import 'package:loginn/NavigationBar/reportError.dart';
import 'package:loginn/NavigationBar/LogOut.dart';
import 'package:loginn/NavigationBar/whatDoICook.dart';
import '../Introduction.dart';
import '../Screens/addCategory.dart';
import '../Screens/denemesayfası.dart';
import '../utils/showSnackBar.dart';
import 'Communication.dart';
import 'Missing.dart';
import 'askedQuestion.dart';
import 'categories.dart';
import 'discover.dart';
import 'package:loginn/demointro.dart'as DemoIntro ;
class MakeMenu extends StatefulWidget {
  @override
  _MakeMenuState createState() => _MakeMenuState();
}
class _MakeMenuState extends State<MakeMenu> {
FirebaseAuth _auth = FirebaseAuth.instance;
@override
// void initState() {
//   super.initState();
//   // _auth değişkenini başlat
//   _auth = FirebaseAuth.instance;
// }
Future<void> logOut(BuildContext context) async {
  try {
    await _auth.signOut();
    // Ek temizlik veya yönlendirme mantığı buraya eklenebilir,
    // kullanıcı başarıyla çıkış yaptıktan sonra
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) =>   const DemoIntro.Demointro(),
    )); // Giriş ekranına yönlendirme
  } catch (e) {
    showSnackBar(context, 'Logout failed. Please try again.'); // Genel bir hata mesajı görüntüleme
  }
}   
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Drawer(width: size.width*0.65,
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(color: usePurple),
              accountName: const Text(
                "NEFİS TARİFLER",
                style: TextStyle(
                  fontSize: 23,
                ),
              ),
              accountEmail: const Text(
                "Damakta Kalan Nefis Tatlar",
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              currentAccountPicture: Image.asset(
                "assets/images/Nefis_Tarifler__6_-removebg-preview.png",
                width: size.width*0.5,
                height: size.height*0.6,
                alignment: Alignment.center,
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: const Icon(
                      Icons.add,
                    ),
                    title: const Text("Kategori Ekle"),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const AddCategory()));
                      
                    },
                  ),
                  ListTile(
                      leading: const Icon(Icons.add_chart),
                      title: const Text("Tarif Ekle"),
                      trailing: const Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const addRecipe()));
                      }),
                  // ListTile(
                  //     leading: const Icon(Icons.article),
                  //     title: const Text("Keşfet"),
                  //     trailing: const Icon(Icons.keyboard_arrow_right),
                  //     onTap: () {
                  //       Navigator.of(context).push(MaterialPageRoute(
                  //           builder: (context) => const Discover()));
                  //     }),
                  
                  ListTile(
                      leading: const Icon(Icons.category),
                      title: const Text("Kategoriler"),
                      trailing: const Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const Categories()));
                      }),
                  ListTile(
                      leading: const Icon(Icons.shopping_bag),
                      title: const Text("Evde Ne Eksik"),
                      trailing: const Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>  MissingItemsPage()));
                      }),
                  ListTile(
                      leading: const Icon(Icons.error),
                      title: const Text("Hata Bildir"),
                      trailing: const Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>  ReportError()));
                      }),
                  ListTile(
                      leading: const Icon(Icons.contact_page),
                      title: const Text("İletişim"),
                      trailing: const Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const Communication()));
                      }),
                  ListTile(
                      leading: const Icon(Icons.question_answer),
                      title: const Text("Sık Sorulan Sorular"),
                      trailing: const Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const AskedQuestion()));
                      }),
                  const AboutListTile(
                    applicationName: " LİSANS",
                    applicationIcon: Icon(Icons.save),
                    applicationVersion: "3.8",
                    child: Text("UYGULAMA HAKKINDA"),
                    icon: Icon(Icons.save),
                    applicationLegalese: null,
                  ),
                  ListTile(
                      leading: const Icon(Icons.people),
                      title: const Text(
                        "Çıkış yap",
                      ),
                      trailing: const Icon(Icons.keyboard_arrow_right),
                      onTap: () {logOut(context);
                      }),
                ],
              ),
            )
          ],
        ),
      );
    
  }
}
