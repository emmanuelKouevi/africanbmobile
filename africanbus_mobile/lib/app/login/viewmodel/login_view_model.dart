import 'package:flutter/material.dart';
import '../../data/models/user.dart';

class LoginViewModel extends ChangeNotifier{

  User userConnected = User();
  bool isConnected = false;
  User get data => userConnected;

  void initializeUserConnected(User user){
    userConnected = user ;
    notifyListeners();
  }
}