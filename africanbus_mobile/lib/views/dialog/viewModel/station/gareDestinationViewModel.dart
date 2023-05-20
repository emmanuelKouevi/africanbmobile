import 'package:flutter/material.dart';

class GareDestinationViewModel extends ChangeNotifier{
  TextEditingController _gareDepart = TextEditingController();
  TextEditingController get data => this._gareDepart;

  void affectController(String station){
    _gareDepart.text = station ;
    notifyListeners();
  }
}