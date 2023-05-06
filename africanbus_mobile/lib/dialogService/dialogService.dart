import 'package:africanbus_mobile/views/dialog/passagerType.dart';
import 'package:africanbus_mobile/views/dialog/passagers.dart';
import 'package:africanbus_mobile/views/dialog/travelDialog.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
      },
    );
  }

  Future<void> showPassagersSectionDialog(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text('Passagers' , style: TextStyle(
              color: Colors.black
            ),),
            elevation: 0,
            iconTheme: IconThemeData(
              color: Colors.black,
              size: 25
            ),
          ),
          body: Center(
              child: PassagersSection()
          ),
        );
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