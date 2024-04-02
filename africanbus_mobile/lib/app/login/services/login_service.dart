import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../global_config/globalConst.dart';
import 'package:http/http.dart' as http;

class AuthentificationService{

  // CONNEXION UTILISATEUR
  Future<dynamic>toLogin(String pseudo , String password)async{
    dynamic user = "";
    Get.dialog(Center(child: CircularProgressIndicator(color: Colors.teal)));
    final url = GlobalConst.remoteApiProd +"/users/login";
    final body = jsonEncode({
      "data" : {
        "login" : pseudo, "password" : password,
      }
    });
    final response = await http.post(Uri.parse(url) , body: body , headers: GlobalConst.requestHeaders);
    try{
      if(response.statusCode == 200){
        final result = jsonDecode(response.body);
        if(result['status']['code'] == '800'){
          user = result['status']['item'];
        }else{
          Get.back();
          Get.snackbar("Erreur" , "Identifant ou mot de passe incorrect", backgroundColor: Colors.red , colorText: Colors.white);
          user = "";
        }
      }
    }catch(e){
      Get.back();
      Get.snackbar("Erreur" , e.toString() , backgroundColor: Colors.red , colorText: Colors.white);
      user = "";
    }
    return user;
  }

  // OUVERTURE D'UN COMPTE UTILISATEUR
  Future<bool>toRegister(String firstname , String lastname , String pseudo , String email)async{
    Get.dialog(Container( child: Center(child: CircularProgressIndicator(color: Colors.teal,))) , barrierDismissible: false);
    bool registeringMode = true;
    final url = GlobalConst.remoteApiProd+'/users';
    final body = jsonEncode({
      "datas":[
        {
          "nom": firstname , "prenoms" : lastname , "login": pseudo , "email": email , "roleCode": "UserSimple"
        }
      ]
    });
    final response = await http.post(Uri.parse(url) , body: body , headers: GlobalConst.requestHeaders);
    try{
      final result = jsonDecode(response.body);
      if(response.statusCode == 200){
        if(result['status']['code'] == '800'){
          Get.back();
          Get.snackbar("Opération effectuée" , "Creation de votre compte est un succès" , backgroundColor: Colors.green, colorText: Colors.white);
          registeringMode = false;
        }else{
          registeringMode = false;
          Get.back();
          Get.snackbar("Erreur" , result['status']['message'], backgroundColor: Colors.red , colorText: Colors.white);
        }
      }
      registeringMode = false;
    }catch(e){
      Get.back();
      Get.snackbar("Erreur" , e.toString() , backgroundColor: Colors.red , colorText: Colors.white);
      registeringMode = false;
    }
    return registeringMode;
  }

}