import 'package:flutter/material.dart';
import 'package:loginn/constants.dart';

class AskedQuestion extends StatelessWidget {
  const AskedQuestion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: usePurple,
        title:const Text('Sıkça Sorulan Sorular'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children:const <Widget>[
          FaqTile(
            question: 'Üyelik ücretli mi?',
            answer: "Nefis Yemek Tarifleri'nin üyelik, tarif göndermek ve diğer tüm hizmetleri tamamen ücretsizdir.",
          ),
          FaqTile(
            question: 'Gönderilen Tariflerden Para Kazanılıyor mu? ',
            answer: 'Hayır',
          ),
          FaqTile(
            question: 'Nasıl tarif gönderebilirim?',
            answer: 'Giriş yaptıktan sonra kenardaki menüde tarif ekle seçeneği bulunmakta. oradan tarif gönderilebilir',
          ),
          FaqTile(
            question: 'Neden Tarif Göndermeliyim?',
            answer: 'Tarifleriniz binlerce kişinin sofrasına ulaşması için',
          ),
          FaqTile(
            question: 'Mobil uygulamada tarif kategorilerine ulaşamıyorum.',
            answer: 'Giriş yapmanın ardından kenardaki menüde kategoriler yer almaktadır. oradan istediğiniz kategorideki tarife ulaşabilirsiniz',
          ),
        ],
      ),
    );
  }
}

class FaqTile extends StatefulWidget {
  final String question;
  final String answer;

  const FaqTile({
    Key? key,
    required this.question,
    required this.answer,
  }) : super(key: key);

  @override
  _FaqTileState createState() => _FaqTileState();
}

class _FaqTileState extends State<FaqTile> {
  bool _expanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        title: Text(
          widget.question,
          style: TextStyle(color: 
          Color.fromARGB(255, 2, 24, 88),fontWeight: FontWeight.bold),
        ),
        childrenPadding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
        children: <Widget>[
          Text(
            widget.answer,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
        onExpansionChanged: (expanded) {
          setState(() {
            _expanded = expanded;
          });
        },
        trailing: _expanded ? Icon(Icons.keyboard_arrow_up) : Icon(Icons.keyboard_arrow_down),
      ),
    );
  }
}
