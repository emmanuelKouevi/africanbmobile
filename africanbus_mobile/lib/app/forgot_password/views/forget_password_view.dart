import 'package:africanbus_mobile/app/forgot_password/views/check_opt_verification.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../custom_widgets/custom_text_form_field.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({Key?key}):super(key: key);

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  TextEditingController email = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    final spacer = SizedBox(height: 10);

    final emailRetrieving = IntlPhoneField(
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
      controller: phoneController,
      onChanged: (phone) {
        //controller.phoneNumberController(phone.number);
        //controller.countryCode(phone.countryISOCode);
      },
      keyboardType: TextInputType.phone,
      invalidNumberMessage: "Numéro de téléphone invalide",
      countries: countries,
      // ignore: deprecated_member_use
    );


    final sendCodeBtn = Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Color(0xff273c75),
                Colors.teal.shade700,
                Colors.teal
              ]
          )
      ),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent.withOpacity(0.0),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
          ),
          onPressed: () => Get.to(CheckOptMail()),
          child: Text("Envoyer le code".toUpperCase(), style: TextStyle(
              color: Colors.white
          ),)
      ),
    );

    final title1 = Container(
        child: Text(
            "Mot de passe oublié !!!".toUpperCase(),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold
          ),
        ),
    );

    final title2 = Text(
      "Vous avez oublié votre mot de passe , pas d'inquiétude",
      textAlign: TextAlign.center,
      style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 20,
          color: Colors.black.withOpacity(0.6)
      ),
    );

    final form = Form(
        child: Column(
          children: [
            spacer,
            emailRetrieving,
            spacer,
            sendCodeBtn,
            spacer,

          ],
        )
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(
            color: Colors.black
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: 100,
          left: 20.0,
          right: 20.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            title1,
            title2,
            spacer,
            form
          ],
        ),
      ),
    );
  }
}
