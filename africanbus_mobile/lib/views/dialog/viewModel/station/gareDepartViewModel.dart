import 'package:flutter/material.dart';

class GareDepartViewModel extends ChangeNotifier{
  TextEditingController _gareDepart = TextEditingController();
  TextEditingController get data => this._gareDepart;

  void affectController(TextEditingController station){
    _gareDepart = station ;
    print(station.text);
    notifyListeners();
  }
}