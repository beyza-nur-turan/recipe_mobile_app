import 'package:flutter/material.dart';
class denemesayfasi extends StatefulWidget {
  const denemesayfasi({super.key});

  @override
  State<denemesayfasi> createState() => _denemesayfasiState();
}

class _denemesayfasiState extends State<denemesayfasi> {
  // 
  @override
  Widget build(BuildContext context) {
    return  Scaffold(body:CustomScrollView(
  slivers: [
    SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Row(
            children: [
              // row içeriği
            ],
          );
        },
        //childCount: itemCount,
      ),
    ),
    SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Column(
            children: [
              // column içeriği
            ],
          );
        },
       // childCount: itemCount,
      ),
    ),
  ],
)

,);
  }
}


