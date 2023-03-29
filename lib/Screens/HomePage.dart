import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:loginn/constants.dart';

import '../NavigationBar/MakeMenu.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(drawer: MakeMenu(),appBar: AppBar(
      backgroundColor: usePurple,
      ),
        body: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [GNav(
            mainAxisAlignment: MainAxisAlignment.center,
            backgroundColor: Colors.white,
            rippleColor:const Color.fromARGB(255, 134, 128, 165), //butona  bastığın an rengin dalgalanması
            hoverColor: const Color.fromARGB(255, 134, 128, 165), //fare üzerine gelince rengin değişmesi
            haptic: true, //geri bildirim
            tabBorderRadius: 32,
            tabActiveBorder:
                Border.all( color: Colors.white, width: 1), //buton kenarı
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
            tabBackgroundColor:const Color.fromARGB(255, 148, 119, 173).withOpacity(0.1), //sekme arka plan rengi
            padding: const EdgeInsets.symmetric(
                horizontal: 20, vertical: 16), // gezinme çubuğu genişliği
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Ana sayfa',textStyle: TextStyles.testStyle
              ),
              GButton(
                icon: Icons.book,
                text: 'Defterim',textStyle: TextStyles.testStyle
              ),
              GButton(
                icon: Icons.search,textStyle:TextStyles.testStyle,
                text: 'Ara',
              ),
              GButton(
                icon: Icons.person,textStyle: TextStyles.testStyle,
                text: 'Profilim',
              )
            ])
        
      ],
    ));
  }
}
class TextStyles{
  static const testStyle=TextStyle(fontWeight: FontWeight.w900,color: usePurple,fontSize: 16);
}