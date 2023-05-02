import 'dart:io';//dosya işlemleri için
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loginn/constants.dart';
import '../widgets/recipeTextFormField.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

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
  TextEditingController photoController = TextEditingController();
  //String uid = FirebaseAuth.instance.currentUser!.uid;
  void selectShowPhoto(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                      onTap: () {
                        LoadSelection(ImageSource.gallery);
                      },
                      title:const Text("Galeriden fotoğraf seç")),
                  ListTile(
                      onTap: () {
                        LoadSelection(ImageSource.camera);
                      },
                      title:const Text("Kameradan fotoğraf çek")),
                ],
              ),
            ));
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
  // Reference referencePath = storage
  //     .ref()
  //     .child("yemekler")
  //     .child(auth.currentUser!.uid)
  //     .child("${auth.currentUser!.uid}.png");
      final uuid = Uuid();
final fileName = '${uuid.v4()}.png'; // rastgele bir dosya adı oluşturun
final referencePath = storage
    .ref()
    .child('yemekler')
    .child('${titleController.text}.png');
  if (selectFolder!.existsSync()) {
    UploadTask uploadMission = referencePath.putFile(selectFolder!);
    var url = await (await uploadMission.whenComplete(() {})).ref.getDownloadURL();
    setState(() {
      uploadLink = url;
    });await firestore.collection("recipe").doc(titleController.text).set({
      //await ile işaretledik. bu sayede kod işlemin tamamlanmasını bekleyecek.
      'image_url': url,
      "addPhoto": photoController.text,
      "cooking": cookingController.text,
      "cookingStep": howCookController.text,
      "cookingTips": clueController.text,
      "forHowManyPerson": numberOfPeopleController.text,
      "materials": materialsController.text,
      "preparation": preparationController.text,
      "recipeTitle": titleController.text
    });
    debugPrint("upload edilen resmin url" + url);
  } else {
    print("Boş veya dosyaya erişilemiyor.");
  }
}
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1, mainAxisExtent: 125.0, // maksimum genişlik
        childAspectRatio: 1, // Elemanların yükseklik ve genişlik oranı
        mainAxisSpacing: 0.3, // Satırlar arasındaki boşluk
        crossAxisSpacing: 0.5, //Elemanlar arasındaki boşluk
      ),
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 15, top: 40),
          child: Text(
            "Enfes Tariflerinizi\nBizimle Paylaşın",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 25,
                color: son,
                fontWeight: FontWeight.w400,
                fontFamily: "lobster"),
          ),
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
            labelText: "foto", maxLines: 4, controllerRecipe: photoController),
        IconButton(
          onPressed: () {
            selectShowPhoto(context);
          },
          icon: const Icon(Icons.add_a_photo_rounded),
        ),
        Container(
          width: size.width * 0.5,
          height: size.height * 0.3,
          child: ElevatedButton(
            style: const ButtonStyle(alignment: Alignment.center),
            onPressed: () {
              LoadSelection;
            },
            child: const Text(
              "Tarif Ekle",
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ),
      ],
    ));
  }
}
