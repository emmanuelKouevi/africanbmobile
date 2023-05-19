import 'package:africanbus_mobile/views/dialog/gareDestinationDialog.dart';
import 'package:africanbus_mobile/views/dialog/passagerTypeDialog.dart';
import 'package:africanbus_mobile/views/dialog/passagers.dart';
import 'package:africanbus_mobile/views/dialog/gareDepartDialog.dart';
import 'package:flutter/material.dart';

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

  Future<void> showSelectCityDestinationTravelDialog(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return GareDestinationDialog();
      },
    );
  }

  Future<void> showPassagersSectionDialog(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return PassagersSection();
      },
    );
  }

  Future<void> showSelectTypePassagersDialog(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return PassagersType();
      },
    );
  }
}