import 'package:africanbus_mobile/app/login/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class WarningNotAccount extends StatelessWidget {
  const WarningNotAccount({Key ? key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: ListTile(
        leading: FaIcon(FontAwesomeIcons.triangleExclamation , color: Colors.red),
        title: Text("Attention !!!" , style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20
        ),),
      ),
      content: Text("Aucun compte détecter!! Veuillez vous connectez pour poursuivre votre opération." , textAlign: TextAlign.center, style: TextStyle(
        fontWeight: FontWeight.w300,
        fontSize: 15
      ),),
      actions: [
        TextButton(
            onPressed: () => Get.back(),
            child: Text("Annuler" ,  style: TextStyle(
                color: Colors.teal.shade800
            ),)
        ),
        TextButton(
            onPressed: () => Get.to(LoginView()),
            child: Text("Se connecter" , style: TextStyle(
              color: Colors.teal.shade800
            ),)
        )
      ],
    );
  }
}

