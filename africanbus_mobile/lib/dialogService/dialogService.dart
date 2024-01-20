import 'package:flutter/material.dart';
import '../presentations/dialog/gare_depart_dialog.dart';
import '../presentations/dialog/gare_destination_dialog.dart';

class DialogService {

  /*
    - Date : 28-04-2023
    - Création d'un service de dialogue.
   */

  Future<void> showSelectCityDepartureTravelDialog(BuildContext context , TextEditingController villeDepart) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return GareDepartDialog(villeGareDepart: villeDepart,);
      },
    );
  }

  Future<void> showSelectCityDestinationTravelDialog(BuildContext context, TextEditingController villeDestination) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return GareDestinationDialog(villeGareDestination: villeDestination ,);
      },
    );
  }


}