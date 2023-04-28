import 'package:africanbus_mobile/views/dialog/travelDialog.dart';
import 'package:flutter/material.dart';

class DialogService {

  /*
    - Date : 28-04-2023
    - Création d'un service de dialogue.
   */

  Future<void> showSelectCityForTravelDialog(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Scaffold(
          body: TravelDialog(),
        );
        /*return Dialog(
          elevation: 3,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
          ),
          child: TravelDialog(),
        );*/
      },
    );
  }
}