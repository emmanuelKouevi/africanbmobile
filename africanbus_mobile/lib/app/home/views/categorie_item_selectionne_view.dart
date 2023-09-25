import 'package:africanbus_mobile/app/data/models/categorieVoyageur.dart';
import 'package:africanbus_mobile/app/home/controllers/home_controller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class CategorieSelectionneItem extends GetView{
  const CategorieSelectionneItem(this.typePassager, {Key? key}) : super(key: key);
  final TypePassager typePassager ;

  @override
  Widget build(BuildContext context) {

    final homeController = Get.put(HomeController());

    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Card(
        elevation: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.3),
              ),
              child: ListTile(
                title: Text(typePassager.typeDesignation , style: TextStyle(
                    fontWeight: FontWeight.bold
                ),),
                trailing: IconButton(
                    icon: FaIcon(FontAwesomeIcons.xmark),
                    onPressed: () {
                      homeController.removeVoyageur(typePassager);
                      homeController.update();
                    },
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15 , left: 5),
              height: MediaQuery.of(context).size.height/25,
              child: Text('Cartes et codes de réduction', textAlign: TextAlign.center,),
            ),
          ],
        ),
      ),
    );
  }
}