import 'package:africanbus_mobile/app/data/models/categorieVoyageur.dart';
import 'package:africanbus_mobile/services/service_web.dart';
import 'package:africanbus_mobile/views/dialog/widgets/categoryTraveller/categoryPassagerItem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/*
   - Date : 11-05-2023
   - Author : Kouevi Ayite Emmanuel Herve
   - Description : Un widget Alert permettant l'affichage
      des categories voyageurs provenant du service web
 */
class PassagersTypeList extends GetView{
  const PassagersTypeList({ Key? key }): super(key: key);

  @override
  Widget build(BuildContext context) {

    List<TypePassager> categoriesPassagersList = [];

    final categoryPassagersList = FutureBuilder(
      future: ServiceWebApi().getCategoryTravellerMocking(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          categoriesPassagersList = snapshot.data ;
          return ListBody(
            children: categoriesPassagersList.map((typePassager){
              return CategoryTravellerItem(typePassager: typePassager);
            }).toList(),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );

    //const hr = SizedBox(height: 10);

    return AlertDialog(
      title: Text('Choisissez le type de passager' , style: TextStyle(
        fontSize: 18,
        color: Colors.teal.shade900
      ),),
      content: SingleChildScrollView(
          child: categoryPassagersList
      ),
    );
  }
}

