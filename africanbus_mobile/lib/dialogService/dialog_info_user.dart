import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../custom_widgets/custom_text_form_field.dart';

class DialogUserInfo extends StatefulWidget {
  const DialogUserInfo({Key?key}):super(key: key);

  @override
  State<DialogUserInfo> createState() => _DialogUserInfoState();
}

class _DialogUserInfoState extends State<DialogUserInfo> {
  final TextEditingController nameOtherPerson = TextEditingController();
  final TextEditingController surnameOtherPerson = TextEditingController();
  final TextEditingController _telephone = TextEditingController();
  @override
  Widget build(BuildContext context) {

    final nomTiersPersonne = Container(
      child: CustomTextFormField(
        controller: nameOtherPerson,
        icon: Icons.person,
        key: Key("nameField"),
        labelText: "Votre Nom",
        isOutlined: false,
        enabled: true,
      ),
    );

    final prenomTiersPersonne = Container(
      child: CustomTextFormField(
        controller: surnameOtherPerson,
        icon: Icons.person_add,
        key: Key("nameField"),
        labelText: "Votre Nom",
        isOutlined: false,
        enabled: true,
      ),
    );

    final number = IntlPhoneField(
      decoration: const InputDecoration(
          labelText: 'Numéro de téléphone',
          labelStyle: TextStyle(
              color: Colors.black
          ),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.teal,
                  width: 2
              )
          )
      ),
      initialCountryCode: 'CI',
      controller: _telephone,
      onChanged: (phone) {
        //controller.phoneNumberController(phone.number);
        //controller.countryCode(phone.countryISOCode);
      },
      keyboardType: TextInputType.phone,
      invalidNumberMessage: "Mauvais format du numéro",
      countries: countries,
      // ignore: deprecated_member_use
    );


    return AlertDialog(
      title: Text('Infos du voyageur'.toUpperCase(),style: GoogleFonts.ubuntu(
          fontSize: 15,
          color: Colors.black,
          fontWeight: FontWeight.bold
      ),),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          nomTiersPersonne,
          prenomTiersPersonne,
          number
        ],
      ),
      actions: [
        TextButton(
          child: const Text("Retour" , style: TextStyle(
              color: Color(0xff2c3e50)
          ),),
          onPressed: () {
            Get.back();
          },
        ),
        TextButton(
          child: const Text("Suivant" , style: TextStyle(
            color: Color(0xff2c3e50),
          ),),
          onPressed: () {

          },
        ),
      ],
    );
  }
}
