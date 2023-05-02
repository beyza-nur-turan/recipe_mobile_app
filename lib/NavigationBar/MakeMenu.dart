import 'package:flutter/material.dart';
import 'package:loginn/Screens/RecipeHome.dart';
import 'package:loginn/Screens/addRecipe.dart';
import 'package:loginn/constants.dart';
import 'package:loginn/core/config/app_router.gr.dart';
import 'package:loginn/main.dart';
import 'package:loginn/NavigationBar/reportError.dart';
import 'package:loginn/NavigationBar/searchRecipe.dart';
import 'package:loginn/NavigationBar/whatDoICook.dart';
import 'Communication.dart';
import 'Missing.dart';
import 'askedQuestion.dart';
import 'categories.dart';
import 'discover.dart';


class MakeMenu extends StatefulWidget {
  @override
  _MakeMenuState createState() => _MakeMenuState();
}

class _MakeMenuState extends State<MakeMenu> {
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
                      Icons.home,
                    ),
                    title: const Text("Giriş Yap"),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const RecipeHome()));
                      
                    },
                  ),
                  ListTile(
                      leading: const Icon(Icons.fiber_new_sharp),
                      title: const Text("Ne Pişirsem"),
                      trailing: const Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const addRecipe()));
                      }),
                  ListTile(
                      leading: const Icon(Icons.article),
                      title: const Text("Keşfet"),
                      trailing: const Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const Discover()));
                      }),
                  ListTile(
                      leading: const Icon(Icons.people),
                      title: const Text(
                        "Tarif Ara",
                      ),
                      trailing: const Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const SearchRecipe()));
                      }),
                  ListTile(
                      leading: const Icon(Icons.video_collection_outlined),
                      title: const Text("Kategoriler"),
                      trailing: const Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const Categories()));
                      }),
                  ListTile(
                      leading: const Icon(Icons.chat_bubble_outline_sharp),
                      title: const Text("Evde Ne Eksik"),
                      trailing: const Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const Missing()));
                      }),
                  ListTile(
                      leading: const Icon(Icons.chat_bubble_outline_sharp),
                      title: const Text("Hata Bildir"),
                      trailing: const Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const ReportError()));
                      }),
                  ListTile(
                      leading: const Icon(Icons.chat_bubble_outline_sharp),
                      title: const Text("İletişim"),
                      trailing: const Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const Communication()));
                      }),
                  ListTile(
                      leading: const Icon(Icons.chat_bubble_outline_sharp),
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
                  )
                ],
              ),
            )
          ],
        ),
      );
    
  }
}