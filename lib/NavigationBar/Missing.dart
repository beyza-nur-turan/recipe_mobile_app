import 'package:flutter/material.dart';
import 'package:loginn/constants.dart';
import 'package:url_launcher/url_launcher.dart';
class MissingItemsPage extends StatefulWidget {
  @override
  _MissingItemsPageState createState() => _MissingItemsPageState();
}

class _MissingItemsPageState extends State<MissingItemsPage> {
  List<String> _missingItems = [];
  final _textEditingController = TextEditingController();

// _launchURL() async {
//   const url = 'https://getir.com/'; // açmak istediğimiz URL
//   try {
//     if (await canLaunchUrl(Uri.parse(url))) {
//     await launchUrl(Uri.parse(url));
//   } else {
//     throw 'Could not launch $url';
//   }
//   } catch (e, stackTrace) {
//     print('Hata: $e');
//     print('Stack Trace: $stackTrace');
//   }
// }
final Uri _url = Uri.parse('https://getir.com');
final Uri _url2=Uri.parse("https://www.yemeksepeti.com/city/samsun?gclid=CjwKCAjwpayjBhAnEiwA-7enaxqkOtiOCX1u3BlIZ2pLFXuGiBa_lSojptQfOBSSU2yHkXfvoaSudhoC_A4QAvD_BwE");
Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}
Future<void> _launchUrl2() async {
  if (!await launchUrl(_url2)) {
    throw Exception('Could not launch $_url2');
  }
}

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(decoration: BoxDecoration(
                color: const Color.fromARGB(255, 227, 233, 228),
                image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.7), BlendMode.dstATop),
                  image: const NetworkImage(
                      'https://images.pexels.com/photos/3776947/pexels-photo-3776947.jpeg?auto=compress&cs=tinysrgb&w=600'),
                  //https://images.pexels.com/photos/10895939/pexels-photo-10895939.jpeg?auto=compress&cs=tinysrgb&w=600
                  //https://images.pexels.com/photos/3776950/pexels-photo-3776950.jpeg?auto=compress&cs=tinysrgb&w=600
                  fit: BoxFit.cover,
                ),
              ),
        child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           const Text("ALIŞVERİŞ LİSTESİ",style: TextStyle(fontSize: 30,color: Color.fromARGB(255, 52, 4, 115),fontWeight: FontWeight.bold),),
          const SizedBox(height: 20),
          
               Center(
                child: Card(
                  shape:
                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
                  elevation: 10,
                  child: Container(
                    width: size.width * 0.86,
                    height: size.height * 0.74,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        colorFilter: ColorFilter.mode(
                           const Color.fromARGB(255, 199, 176, 200).withOpacity(0.25),
                            BlendMode.dstATop),
                        image: const NetworkImage(
                            'https://images.pexels.com/photos/3776947/pexels-photo-3776947.jpeg?auto=compress&cs=tinysrgb&w=600'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Eksik Malzemeyi Girin',
                              labelStyle: TextStyle(color: siyah, fontSize: 16),
                              // focusedBorder: OutlineInputBorder(
                              //           borderRadius: BorderRadius.all(Radius.circular(15)),
                              //           borderSide:  BorderSide(
                              //             color: usePurple,
                              //           ),
                              //         ),
                            ),
                            controller: _textEditingController,
                            onFieldSubmitted: (value) {
                              setState(() {
                                _missingItems.add(value);
                              });
                            },
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: const Size(100, 45),
                              backgroundColor: usePurple),
                          onPressed: () {
                            if (_textEditingController.text.isNotEmpty) {
                              setState(() {
                                _missingItems.add(_textEditingController.text);
                                _textEditingController.clear();
                              });
                              _textEditingController.clear();
                            }
                          },
                          child: const Text(
                            'Ekle',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Expanded(
                          child: ListView.builder(
                            itemCount: _missingItems.length,
                            itemBuilder: (context, index) {
                              final missingItem = _missingItems[index];
                              return Container(
                                width: size.width * 0.6,
                                height: size.height * 0.07,
                                margin: const EdgeInsets.all(4),
                                decoration: const BoxDecoration(),
                                child: Card(
                                  elevation: 7,
                                  child: ListTile(
                                    title: Text(
                                      " $missingItem",
                                      style: const TextStyle(
                                          fontSize: 16, fontWeight: FontWeight.w500),
                                    ),
                                    trailing: IconButton(
                                      color: usePurple,
                                      iconSize: 30,
                                      icon: const Icon(Icons.delete),
                                      onPressed: () {
                                        setState(() {
                                          _missingItems.removeAt(index);
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround ,
                children: [
                  TextButton(onPressed: _launchUrl, child:const Text("Getir",style: TextStyle(fontSize: 18,color: Color.fromARGB(255, 52, 4, 115)),)),
                   TextButton(onPressed: _launchUrl2, child:const Text("Yemek Sepeti",style: TextStyle(fontSize: 18,color: Color.fromARGB(255, 52, 4, 115)),)),
                ],
              )
            
          ],
        ),
      ),
    );
  }
}
