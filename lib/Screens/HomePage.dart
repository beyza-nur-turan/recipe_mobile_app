import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(children: [GNav(
 rippleColor: Colors.grey, //butona  bastığın an rengin dalgalnaması
 hoverColor: Colors.grey, //fare üzerine gelince rengin değişmesi
 haptic: true, //geri bildirim
 tabBorderRadius: 15, 
 tabActiveBorder: Border.all(color: Colors.black, width: 1), //buton kenarı
 tabBorder: Border.all(color: Colors.grey, width: 1), // buton kenarı 
 tabShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 8)], //buton gölgesi
 curve: Curves.easeOutExpo, //animasyon stili
 duration:const Duration(milliseconds: 900), //animasyon süresi
 gap: 8, //simge ve metin arasındaki buton boşluğu
 color: Colors.grey[800],  
 activeColor: Colors.purple, //seçilen simge ve metin rengi
 iconSize: 24, //buton boyutu
 tabBackgroundColor: Colors.purple.withOpacity(0.1), //sekme arka plan rengi
 padding:const EdgeInsets.symmetric(horizontal: 20, vertical: 5), // gezinme çubuğu genişliği
 tabs:const [
 GButton(
 icon: Icons.home,
 text: 'Home',
 ),
 GButton(
 icon: Icons.book,
 text: 'Likes',
 ),
 GButton(
 icon: Icons.search,
 text: 'Search',
 ),
 GButton(
 icon: Icons.person,
 text: 'Profile',
 )
 ]
)],);
  }
}
