import 'package:africanbus_mobile/app/home/controllers/home_controller.dart';
import 'package:africanbus_mobile/app/home/views/categorie_voyageur_selectionnes_view_list.dart';
import 'package:africanbus_mobile/views/dialog/passagerTypeDialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../app/data/models/categorieVoyageur.dart';


class TypePassagerDialog extends StatefulWidget {
  TypePassagerDialog({Key?key, required this.passagerController}):super(key: key);
  TextEditingController passagerController ;

  @override
  State<TypePassagerDialog> createState() => _TypePassagerDialogState();
}

class _TypePassagerDialogState extends State<TypePassagerDialog> {

  final homeController = Get.put(HomeController(), permanent: true);
  List<String>passagerList = [];
  int categorieEnfant = 0;
  int categorieAdulte = 0;
  int categorieJeune = 0;


  @override
  Widget build(BuildContext context) {


    final title = Text(
      "Selection de passagers".toUpperCase(), textAlign: TextAlign.start,
      style: TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20
      ),
    );

    final addPersonBtn = ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
      child: Text(
        "AJOUTER UNE PERSONNE".toUpperCase(),
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () => Get.dialog(PassagersTypeList()), //DialogService().showSelectTypePassagersDialog(context),
    );

    final noTraveller = Center(
      child: Container(
        margin: EdgeInsets.only(top: 150),
        child: Column(
          children: [
            SvgPicture.asset('assets/svg_icons/no_user.svg', height: 100),
            SizedBox(height: 10),
            Text('Oups... Pas de Passagers' , style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25
            ),)
          ],
        ),
      ),
    );

    final travellerExist = SingleChildScrollView(
      child: Column(
        children: [
          Obx(() => CategorieVoyageurSelectionnesListView(homeController.categoriesVoyageurList.value)),
        ],
      ),
    );

    final saveBtn = ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.teal.shade900
      ),
      child: Text(
          "ENREGISTRER".toUpperCase(),
          style: GoogleFonts.ubuntu(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 15
          )
      ),
      onPressed: () {
        homeController.categoriesVoyageurList.value.forEach((element) {
          passagerList.add(element.typeDesignation);
        });

        homeController.categoriesVoyageurList.value.forEach((element) {
          if(element.typeDesignation == "Enfant"){
            categorieEnfant++;
          }
          if(element.typeDesignation == "Adulte"){
            categorieAdulte++;
          }
          if(element.typeDesignation == "Jeune"){
            categorieJeune++;
          }
        });
        widget.passagerController.text = categorieEnfant.toString() + ' ' + 'Enfant(s),' + categorieJeune.toString() + ' ' + 'Jeune(s),' + categorieAdulte.toString() + ' ' + 'Adulte(s)';
        print(widget.passagerController.text);
        Get.back();
        homeController.update();
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: title,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Obx(() => homeController.categoriesVoyageurList.length == 0 ? noTraveller : travellerExist),
          Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      blurRadius: 6.0,
                      spreadRadius: 1.0,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    addPersonBtn,
                    saveBtn,
                  ],
                ),
              )
          ),
        ],
      ),
    );
  }
}
