import 'package:africanbus_mobile/app/data/models/customer.dart';
import 'package:africanbus_mobile/app/data/models/ticket.dart';
import 'package:africanbus_mobile/dialogService/confirm_reservation_other_people.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../custom_widgets/custom_text_form_field.dart';

class DialogUserInfo extends StatefulWidget {
  final Billet billet ;
  const DialogUserInfo({Key?key , required this.billet}):super(key: key);

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
        labelText: "Nom",
        isOutlined: false,
        enabled: true,
      ),
    );

    final prenomTiersPersonne = Container(
      child: CustomTextFormField(
        controller: surnameOtherPerson,
        icon: Icons.person_add,
        key: Key("nameField"),
        labelText: "Prénoms",
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
            if(nameOtherPerson.text.isEmpty){
              Get.snackbar("Erreur", "Le nom de la tiers personne est obligatoire", backgroundColor: Colors.red , colorText: Colors.white);
            }else if(surnameOtherPerson.text.isEmpty){
              Get.snackbar("Erreur", "Le prenom de la tiers personne est obligatoire", backgroundColor: Colors.red , colorText: Colors.white);
            }else if(_telephone.text.isEmpty){
              Get.snackbar("Erreur", "Le numero de la tiers personne est obligatoire", backgroundColor: Colors.red , colorText: Colors.white);
            }else{
              CustomerApp customer = CustomerApp(
                  id: "Customer", firstname: nameOtherPerson.text,
                  lastname: surnameOtherPerson.text, phoneNumber: _telephone.text
              );
              Get.dialog(ConfirmReservation(customer: customer, billet: widget.billet));
            }
          },
        ),
      ],
    );
  }
}
