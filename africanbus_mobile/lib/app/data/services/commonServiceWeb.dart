import 'dart:convert';
import 'dart:developer';
import 'package:africanbus_mobile/app/data/models/villeModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http ;

import '../../../global_config/globalConst.dart';

class CommonServiceWeb {

  final myObject = {};

  //Récupérer la liste des villes
  Future<List<Ville>>obtenirListeDesVilles() async{
    List<Ville> villesList = [];
    final url = GlobalConst.remoteApiProd +"/villes/getAllCities";
    final body = jsonEncode(myObject);
    print("My body is : $body");
    final response = await http.post(Uri.parse(url) , body: body , headers: GlobalConst.requestHeaders);
    try{
      print('Dans le try');
      print(json.decode(response.body)['items']);
      if(response.statusCode == 200){
        final result = jsonDecode(response.body);
        print('Nous affichons les resultats');
        if(result['status']['code'] == '800'){
          villesList = (result['items'] as List)
              .map((i) => Ville.fromJson(i))
              .toList();
          print(villesList.length);
        }else{
          villesList = [];
          Get.snackbar("Erreur", result['status']['message'] , backgroundColor: Colors.red , colorText: Colors.white);
        }
      }
    }catch(e){
      Get.snackbar("Erreur", e.toString() , backgroundColor: Colors.red , colorText: Colors.white);
      villesList = [];
    }
    return villesList;
  }
}