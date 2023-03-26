import 'package:flutter/material.dart';
import 'package:loginn/constants.dart';
import 'package:loginn/core/config/app_router.gr.dart';
import 'package:loginn/main.dart';
import 'package:loginn/sideBar/reportError.dart';
import 'package:loginn/sideBar/searchRecipe.dart';
import 'package:loginn/sideBar/whatDoICook.dart';
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
    return Scaffold(
      appBar: AppBar(title:const Text("Ana Sayfa"), centerTitle: true,),
      body: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              decoration:const BoxDecoration(color: Colors.cyan),
              accountName:const Text(
                "NEFİS TARİFLER",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              accountEmail:const Text(
                "nefistarifler.com ",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
              currentAccountPicture: Image.asset(
                "assets/images/Nefis_Tarifler__6_-removebg-preview.png",
                alignment: Alignment.center,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading:const Icon(
                      Icons.home,
                    ),
                    title:const Text("Giriş Yap"),
                    trailing:const Icon(Icons.keyboard_arrow_right),
                    onTap: () {router.push(const SignIn());
                    },
                  ),
                  ListTile(
                      leading:const Icon(Icons.fiber_new_sharp),
                      title:const Text("Ne Pişirsem"),
                      trailing:const Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>const  WhatDoICook()));
                      }),
                  ListTile (
                      leading:const Icon(Icons.article),
                      title:const Text("Keşfet"),
                      trailing:const Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>const Discover()));
                      }),
                  ListTile(
                      leading:const Icon(Icons.people),
                      title:const Text(
                        "Tarif Ara",
                      ),
                      trailing:const Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>const SearchRecipe()));
                      }),
                  ListTile(
                      leading:const Icon(Icons.video_collection_outlined),
                      title:const Text("Kategoriler"),
                      trailing:const Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) =>const Categories()));
                      }),
                  ListTile(
                      leading:const Icon(Icons.chat_bubble_outline_sharp),
                      title:const Text("Evde Ne Eksik"),
                      trailing:const Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>const Missing()));
                      }),
                      ListTile(
                      leading:const Icon(Icons.chat_bubble_outline_sharp),
                      title:const Text("Hata Bildir"),
                      trailing:const Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>const ReportError()));
                      }),
                      ListTile(
                      leading:const Icon(Icons.chat_bubble_outline_sharp),
                      title:const Text("İletişim"),
                      trailing:const Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>const Communication()));
                      }),
                      ListTile(
                      leading:const Icon(Icons.chat_bubble_outline_sharp),
                      title:const Text("Sık Sorulan Sorular"),
                      trailing:const Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>const AskedQuestion()));
                      }),
                const  AboutListTile(
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
      ),
    );
  }
}