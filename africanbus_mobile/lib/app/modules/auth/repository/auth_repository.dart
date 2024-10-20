import 'package:africanbus_mobile/app/login/services/login_service.dart';
import 'package:flutter/material.dart';
import '../../../data/models/user.dart';

class AuthRepository extends ChangeNotifier {

  AuthentificationService authentificationService = AuthentificationService();

  TextEditingController pseudoOrMailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  User currentUser = User();
  User get _currentUser => currentUser;


  //SERVICE API PERMETTANT LA CONNEXION D'UN UTILISATEUR.
  Future<User> toLogin() async{
    return currentUser = await authentificationService.toLogin(pseudoOrMailController.text, passwordController.text);
  }
}