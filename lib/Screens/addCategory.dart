import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:loginn/constants.dart';
import 'package:lottie/lottie.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final picker = ImagePicker();

Future<void> pickImage() async {
  final pickedFile = await picker.pickImage(source: ImageSource.gallery);
  if (pickedFile != null) {
    final File file = File(pickedFile.path);
    // Dosya yolunu kullanarak depolama kaydetme işlemleri burada gerçekleştirilir.
  }
}

class AddCategory extends StatefulWidget {
  const AddCategory({super.key});

  @override
  State<AddCategory> createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  File? selectFolder;
  File? fileToUpload;
  String? uploadLink;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final storage = FirebaseStorage.instance;
  TextEditingController c_idController = TextEditingController();
  TextEditingController c_nameController = TextEditingController();

// ID kontrol fonksiyonu
  Future<bool> checkIfIdExists(String id) async {
    // Firestore koleksiyonunu ve belirli bir alanı sorgula
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('categories')
        .where('category_id', isEqualTo: id)
        .get();

    // Eğer eşleşen bir belge varsa true döndür, yoksa false döndür
    return snapshot.docs.isNotEmpty;
  }

// ID uyarı mesajı gösteren fonksiyon
  void showIdWarning(BuildContext context, String id) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Uyarı"),
          content: Text("Bu ID zaten mevcut! Lütfen farklı bir ID girin."),
          actions: [
            TextButton(
              child: Text("Tamam"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void selectShowPhoto(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    onTap: () async {
                      Navigator.of(context).pop(); // AlertDialog'ı kapat
                      await Future.delayed(Duration(
                          milliseconds:
                              500)); // İstediğiniz gecikme süresini ayarlayın
                      LoadSelection(ImageSource.gallery);
                    },
                    title: const Text("Galeriden fotoğraf seç"),
                  ),
                  ListTile(
                    onTap: () async {
                      Navigator.of(context).pop(); // AlertDialog'ı kapat
                      await Future.delayed(Duration(
                          milliseconds:
                              500)); // İstediğiniz gecikme süresini ayarlayın
                      LoadSelection(ImageSource.camera);
                    },
                    title: const Text("Kameradan fotoğraf çek"),
                  ),
                ],
              ),
            ));
  }

  void showSuccessMessage() {
    Fluttertoast.showToast(
      msg: 'Kategori başarıyla eklendi',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  void LoadSelection(ImageSource source) async {
    final picker = ImagePicker();
    final selection = await picker.pickImage(source: source);

    if (selection != null) {
      selectFolder = File(selection.path);
    } else {
      print("Seçilen resim yok.");
      return;
    }
    final uuid = Uuid();
    final fileName = '${uuid.v4()}.png'; // rastgele bir dosya adı oluşturun
    final referencePath = storage
        .ref()
        .child('kategoriler')
        .child('${c_nameController.text}.png');
    if (selectFolder!.existsSync()) {
      UploadTask uploadMission = referencePath.putFile(selectFolder!);
      var url =
          await (await uploadMission.whenComplete(() {})).ref.getDownloadURL();
      setState(() {
        uploadLink = url;
      });
      await firestore.collection("categories").doc(c_nameController.text).set({
        //await ile işaretledik. bu sayede kod işlemin tamamlanmasını bekleyecek.
        'category_id': c_idController.text,
        "category_name": c_nameController.text,
        "category_photo": url,
      });
      debugPrint("upload edilen resmin url" + url);
      showSuccessMessage();
    } else {
      print("Boş veya dosyaya erişilemiyor.");
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Lottie.network(
                "https://assets10.lottiefiles.com/packages/lf20_ysas4vcp.json",
                height: size.height * 0.3,
                alignment: Alignment.topLeft),
            const Text(
              "EKSİK OLAN \n KATEGORİYİ EKLEYİN",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 23,
                  color: Color.fromARGB(255, 105, 9, 164),
                  fontWeight: FontWeight.bold),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: TextFormField(
                controller: c_idController,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(
                      width: 2,
                      color: usePurple,
                    ),
                  ),
                  labelText: "id giriniz",
                  labelStyle: TextStyle(color: Colors.black),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide: BorderSide(width: 2.5, color: usePurple),
                  ),
                ),
                onChanged: (value) async {
                  // Girilen ID'yi kontrol et
                  bool idExists = await checkIfIdExists(value);
                  if (idExists) {
                    // ID zaten var, uyarı mesajını göster
                    showIdWarning(context, value);
                  }
                },
              ),
            ),
            TextFormField(
              controller: c_nameController,
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(
                    width: 2,
                    color: usePurple,
                  ),
                ),
                labelText: "kategori adı giriniz",
                labelStyle: TextStyle(color: Colors.black),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  borderSide: BorderSide(width: 2.5, color: usePurple),
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                selectShowPhoto(context);
              },
              icon: const Icon(Icons.add_a_photo_rounded),
            ),
            Container(
              width: size.width * 0.45,
              height: size.height * 0.06,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 86, 27, 163)),
                  alignment: Alignment.center,
                ),
                onPressed: () {
                  LoadSelection;
                },
                child: const Text(
                  "Kategori Ekle",
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
