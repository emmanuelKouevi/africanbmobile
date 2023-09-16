import 'package:africanbus_mobile/service_web/service_web.dart';
import 'package:africanbus_mobile/views/dialog/widgets/categoryTraveller/categoryPassagerItem.dart';
import 'package:flutter/material.dart';

import '../../app/models/categorieVoyageur.dart';

/*
   - Date : 11-05-2023
   - Author : Kouevi Ayite Emmanuel Herve
   - Description : Un widget Alert permettant l'affichage
      des categories voyageurs provenant du service web
 */

class PassagersType extends StatefulWidget {
  const PassagersType({Key? key}) : super(key: key);

  @override
  State<PassagersType> createState() => _PassagersTypeState();
}

class _PassagersTypeState extends State<PassagersType> {

  List<TypePassager> passagersTypeList = [];

  @override
  void initState(){
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    final categoryPassagersList = FutureBuilder(
        future: ServiceWebApi().getCategoryTravellerMocking(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            passagersTypeList = snapshot.data ;
            return ListBody(
              children: passagersTypeList.map((typePassager){
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
      ),),
      content: SingleChildScrollView(
        child: categoryPassagersList
      ),
    );
  }
}
