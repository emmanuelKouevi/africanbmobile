import 'dart:convert';
import 'dart:developer';
import 'package:africanbus_mobile/app/data/models/user.dart';
import 'package:africanbus_mobile/app/login/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../global_config/globalConst.dart';
import 'package:http/http.dart' as http;

class AuthentificationService{

  // CONNEXION UTILISATEUR
  Future<User>toLogin(String pseudo , String password)async{
    User user = User();
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
          user = User.fromJson(result[('item')]);
        }else{
          Get.back();
          Get.snackbar("Erreur" , "Identifant ou mot de passe incorrect", backgroundColor: Colors.red , colorText: Colors.white);
          user = User();
        }
      }
    }catch(e){
      Get.back();
      Get.snackbar("Erreur" , e.toString() , backgroundColor: Colors.red , colorText: Colors.white);
      user = User();
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
        {"nom": firstname , "prenoms" : lastname , "login": pseudo , "email": email , "roleCode": "UserSimple"}
      ]
    });
    final response = await http.post(Uri.parse(url) , body: body , headers: GlobalConst.requestHeaders);
    try{
      final result = jsonDecode(response.body);
      if(response.statusCode == 200){
        if(result['status']['code'] == '800'){
          Get.back();
          Get.snackbar("Opération effectuée" , "Creation de votre compte est un succès" , backgroundColor: Colors.green, colorText: Colors.white);
          registeringMode = true;
          Get.off(LoginView());
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


  // DECONNEXION UTILISATEUR
  Future<bool>toLogout()async{
    bool isLogout = false ;
    Get.dialog(Center(child: CircularProgressIndicator(color: Colors.teal)));
    final url = GlobalConst.remoteApiProd +"/users/logout";
    final body = jsonEncode({
      "data" : {}
    });
    final response = await http.post(Uri.parse(url) , body: body , headers: GlobalConst.requestHeaders);
    try{
      if(response.statusCode == 200){
        final result = jsonDecode(response.body);
        if(result['status']['code'] == '800'){
          isLogout = true;
        }else{
          Get.back();
          isLogout = false ;
        }
      }
    }catch(e){
      Get.back();
      Get.snackbar("Erreur" , e.toString() , backgroundColor: Colors.red , colorText: Colors.white);
      isLogout = false;
    }
    return isLogout;
  }

  // CHANGER DE MOT DE PASSE UTILISATEUR
  Future<bool>changePasswordUser(String email,String oldPassword , String newPassword)async{
    bool passwordHasChanged = false ;
    Get.dialog(Center(child: CircularProgressIndicator(color: Colors.teal)));
    final url = GlobalConst.remoteApiProd +"/users/resetPasswordUser";
    final body = jsonEncode({
      "data" : {
        'email':email, 'oldPassWord':oldPassword, 'newPassWord':newPassword
      }
    });
    log(body);
    final response = await http.post(Uri.parse(url) , body: body , headers: GlobalConst.requestHeaders);
    try{
      if(response.statusCode == 200){
        final result = jsonDecode(response.body);
        if(result['status']['code'] == '800'){
          Get.back();
          Get.snackbar("Succes" , "Mot de passe modifié avec succes", backgroundColor: Colors.green , colorText: Colors.white);
          passwordHasChanged = true;
        }else{
          Get.back();
          Get.snackbar("Erreur" , result['status']['message'] , backgroundColor: Colors.red , colorText: Colors.white);
          passwordHasChanged = false;
        }
      }
    }catch(e){
      Get.back();
      Get.snackbar("Erreur" , e.toString() , backgroundColor: Colors.red , colorText: Colors.white);
      passwordHasChanged = false;
    }
    return passwordHasChanged;
  }



  // CHANGER LE PROFIL DE L'UTILISATEUR
  Future<bool>changerProfil(int id , String nom ,String prenoms , String login)async{
    bool profilHasChanged = false ;
    Get.dialog(Center(child: CircularProgressIndicator(color: Colors.teal)));
    final url = GlobalConst.remoteApiProd +"/users";
    final body = jsonEncode({
      "datas": [
        {
          'id':id, 'nom':nom, 'prenoms':prenoms , 'login':login
        }
      ]
    });
    final response = await http.put(Uri.parse(url) , body: body , headers: GlobalConst.requestHeaders);
    log("La reponse vaut ${response.body}");
    try{
      if(response.statusCode == 200){
        final result = jsonDecode(response.body);
        if(result['status']['code'] == '800'){
          //Get.snackbar("Succes" , "Mot de passe modifié avec succes", backgroundColor: Colors.green , colorText: Colors.white);
          profilHasChanged = true;
          Get.back();
        }else{
          //Get.back();
          //Get.snackbar("Erreur" , result['status']['message'] , backgroundColor: Colors.red , colorText: Colors.white);
          profilHasChanged = false;
          Get.back();
        }
      }
    }catch(e){
      //Get.back();
      //Get.snackbar("Erreur" , e.toString() , backgroundColor: Colors.red , colorText: Colors.white);
      profilHasChanged = false;
      Get.back();
    }
    return profilHasChanged;
  }

}