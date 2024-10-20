import 'package:africanbus_mobile/app/home/services/api_service_reservation.dart';
import 'package:flutter/material.dart';

class ReservationRepository extends ChangeNotifier{

  ApiServiceReservation apiServiceReservation = ApiServiceReservation();
  List<dynamic>programmeList = [];
  List<dynamic> get data => programmeList;

  initializeOffreByFeatures(String villeDepart , String villeDestination , String date) async{
      programmeList = await apiServiceReservation.obtenirOffreVoyagesList(villeDepart, villeDestination, date);
      notifyListeners();
  }

}