import 'package:flutter/material.dart';
import '../../../../app/data/models/categorieVoyageur.dart';


class CategoryPassagerViewModel extends ChangeNotifier {
  List<TypePassager> _categoryVoyageurList = [];
  List<TypePassager> get data => this._categoryVoyageurList;

  void addCategoryVoyageur(TypePassager typePassager){
    _categoryVoyageurList.add(typePassager);
    notifyListeners();
  }

  void removeCategoryVoyageur(TypePassager typePassager){
    _categoryVoyageurList.remove(typePassager);
    notifyListeners();
  }

  void removeAllCategoryVoyageur(){
    _categoryVoyageurList.clear();
    notifyListeners();
  }
}