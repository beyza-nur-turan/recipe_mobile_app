import 'dart:io'; //dosya işlemleri için
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loginn/constants.dart';
import 'package:lottie/lottie.dart';
import '../widgets/recipeTextFormField.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';
import 'package:fluttertoast/fluttertoast.dart';
class addRecipe extends StatefulWidget {
  const addRecipe({super.key});

  @override
  State<addRecipe> createState() => _addRecipeState();
}

class _addRecipeState extends State<addRecipe> {
  File? selectFolder;
  File? fileToUpload;
  String? uploadLink;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final storage = FirebaseStorage.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController titleController = TextEditingController();
  TextEditingController preparationController = TextEditingController();
  TextEditingController cookingController = TextEditingController();
  TextEditingController numberOfPeopleController = TextEditingController();
  TextEditingController clueController = TextEditingController();
  TextEditingController howCookController = TextEditingController();
  TextEditingController materialsController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  //String uid = FirebaseAuth.instance.currentUser!.uid;
  void showSuccessMessage() {
    Fluttertoast.showToast(
      msg: 'Tarif başarıyla eklendi',
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey,
      textColor: Colors.white,
      fontSize: 16.0,
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
              await Future.delayed(Duration(milliseconds: 500)); // İstediğiniz gecikme süresini ayarlayın
              LoadSelection(ImageSource.gallery);
            },
            title: const Text("Galeriden fotoğraf seç"),
          ),
          ListTile(
            onTap: () async {
              Navigator.of(context).pop(); // AlertDialog'ı kapat
              await Future.delayed(Duration(milliseconds: 500)); // İstediğiniz gecikme süresini ayarlayın
              LoadSelection(ImageSource.camera);
            },
            title: const Text("Kameradan fotoğraf çek"),
          ),
        ],
      ),
    )
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
    final referencePath =
        storage.ref().child('yemekler').child('${titleController.text}.png');
    if (selectFolder!.existsSync()) {
      UploadTask uploadMission = referencePath.putFile(selectFolder!);
      var url =
          await (await uploadMission.whenComplete(() {})).ref.getDownloadURL();
      setState(() {
        uploadLink = url;
      });
      await firestore.collection("recipe").doc(titleController.text).set({
        //await ile işaretledik. bu sayede kod işlemin tamamlanmasını bekleyecek.
        'image_url': url,
        "category_name": categoryController.text,
        "cooking": cookingController.text,
        "cookingStep": howCookController.text,
        "cookingTips": clueController.text,
        "forHowManyPerson": numberOfPeopleController.text,
        "materials": materialsController.text,
        "preparation": preparationController.text,
        "recipeTitle": titleController.text
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
        body: ListView(
            //
            children: [
          Lottie.network(
              "https://assets10.lottiefiles.com/packages/lf20_ysas4vcp.json",
              height: size.height * 0.33),
          const Text(
            "Enfes Tariflerinizi\nBizimle Paylaşın",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 25,
                color: Color.fromARGB(255, 105, 9, 164),
                fontWeight: FontWeight.bold,
                fontFamily: "Bodoni Moda"),
          ),
          recipeTextFormField(
            labelText: "Tarif Başlığı",
            maxLines: null,
            controllerRecipe: titleController,
          ),
          recipeTextFormField(
              labelText: "Hazırlama Süresi",
              maxLines: 1,
              controllerRecipe: preparationController),
          recipeTextFormField(
              labelText: "Pişirme Süresi",
              maxLines: 1,
              controllerRecipe: cookingController),
          recipeTextFormField(
              labelText: "Kaç Kişilik",
              maxLines: 1,
              controllerRecipe: numberOfPeopleController),
          recipeTextFormField(
              labelText: "Pişirme İpuçları",
              maxLines: 3,
              controllerRecipe: clueController),
          recipeTextFormField(
              labelText: "Nasıl Pişirilir",
              maxLines: 3,
              controllerRecipe: howCookController),
          recipeTextFormField(
              labelText: "Malzemeler",
              maxLines: 4,
              controllerRecipe: materialsController),
          recipeTextFormField(
              labelText: "Kategori",
              maxLines: 4,
              controllerRecipe: categoryController),
          IconButton(
            onPressed: () {
              selectShowPhoto(context);
            },
            icon: const Icon(Icons.add_a_photo_rounded),
          ),
          Padding(
            padding:
                const EdgeInsets.only(bottom: 40, right: 60, left: 60, top: 20),
            child: SizedBox(
              width: size.width * 0.3,
              height: size.height * 0.065,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color.fromARGB(255, 86, 27, 163)),
                    alignment: Alignment.center,
                  ),
                onPressed: () {
                  LoadSelection;
                },
                child: const Text(
                  "Tarif Ekle",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ),
        ]));
  }
}
