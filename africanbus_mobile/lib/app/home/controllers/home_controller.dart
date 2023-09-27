import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../data/models/categorieVoyageur.dart';

class HomeController extends GetxController{

  RxList<TypePassager> categoriesVoyageurList = <TypePassager>[].obs;

  // ADD A TRAVELLER IN LIST OF TRAVELLERS
  void addVoyageur(TypePassager typePassager) {
    if (categoriesVoyageurList != null) {
      categoriesVoyageurList.add(typePassager);
    }
  }

  // REMOVE A TRAVELLER FROM LIST OF TRAVELLERS SELECTED
  void removeVoyageur(TypePassager typePassager) {
    if (categoriesVoyageurList != null) {
      categoriesVoyageurList.remove(typePassager);
    }
  }

  //FUNCTION TO SELECTED DATE
  void selectedDate(BuildContext context , String day) async {
    DateTime? pickedDate = await showDatePicker(
        context: context, initialDate: DateTime.now(),
        firstDate: DateTime(1950), //DateTime.now() - not to allow to choose before today.
        lastDate: DateTime(2100)
    );

    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      day = formattedDate;
    } else {}
  }
}