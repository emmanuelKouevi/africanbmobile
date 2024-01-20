import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../data/models/categorieVoyageur.dart';
import '../../data/models/city.dart';
import '../../data/models/reservationBillet.dart';
import '../../data/models/ticket.dart';

class HomeController extends GetxController{

  var foundCities = List<City>.empty(growable: true).obs;
  RxList<TypePassager> categoriesVoyageurList = <TypePassager>[].obs;
  RxList<TypePassager> categorieTypeSelectedList = <TypePassager>[].obs;

  // ADD A TRAVELLER IN LIST OF TRAVELLERS
  void addVoyageur(TypePassager typePassager) {
    categoriesVoyageurList.add(typePassager);
    }

  // REMOVE A TRAVELLER FROM LIST OF TRAVELLERS SELECTED
  void removeVoyageur(TypePassager typePassager) {
    categoriesVoyageurList.remove(typePassager);
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

  RxList<Billet> ticketsSelectedList = <Billet>[].obs;
  RxList<ReservationBillet> reservationTicketModelList = <ReservationBillet>[].obs;

  void addReservation(ReservationBillet reservationBillet) {
    reservationTicketModelList.add(reservationBillet);
    update();
    }

  void removeReservation(ReservationBillet reservationBillet) {
    reservationTicketModelList.remove(reservationBillet);
    update();
  }

  void runFilter(String enteredKeyword , List<City> cities) {
    List<City> results = [];
    if (enteredKeyword.isEmpty) {
      results = cities;
    } else {
      results = cities.where((city) =>
          city.designation.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    foundCities.value = results;
  }

}