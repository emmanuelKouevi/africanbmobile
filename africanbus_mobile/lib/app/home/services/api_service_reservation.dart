import 'dart:convert';

import 'package:africanbus_mobile/app/data/models/offre_voyage_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../global_config/globalConst.dart';

class ApiServiceReservation{

  //Récuperer la liste des offres de voyage par critère (Ville depart , ville destination , date)
  Future<List<dynamic>>obtenirOffreVoyagesList(String villeDepart , String villeDestination , String date) async{

    final myObject = {
      "data":{
        "villeDepart": villeDepart, "villeDestination": villeDestination, "dateDepart": date
      }
    };

    List<OffreVoyageModel> offreVoyageList = [];
    final url = GlobalConst.remoteApiProd +"/offreVoyages/getOffreVoyageByCriteria";
    final body = jsonEncode(myObject);
    print("My body is : $body");
    final response = await http.post(Uri.parse(url) , body: body , headers: GlobalConst.requestHeaders);
    try{
      print(json.decode(response.body)['items']);
      if(response.statusCode == 200){
        final result = jsonDecode(response.body);
        if(result['status']['code'] == '800'){
          offreVoyageList = (result['items'] as List)
              .map((i) => OffreVoyageModel.fromJson(i))
              .toList();
        }else{
          offreVoyageList = [];
          Get.snackbar("Erreur", result['status']['message'] , backgroundColor: Colors.red , colorText: Colors.white);
        }
      }
    }catch(e){
      Get.snackbar("Erreur", e.toString() , backgroundColor: Colors.red , colorText: Colors.white);
      offreVoyageList = [];
    }
    return offreVoyageList;
  }

}