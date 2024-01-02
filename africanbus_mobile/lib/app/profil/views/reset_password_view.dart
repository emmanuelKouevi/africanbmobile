import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({Key? key}): super(key: key);

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  TextEditingController customerPhone = TextEditingController();

  @override
  Widget build(BuildContext context) {

    const space = SizedBox(height: 60,);

    const hr = SizedBox(height: 20,);

    final title = Text("Reinitialisation", style: GoogleFonts.ubuntu(
        color: Colors.black.withOpacity(0.7),
        fontWeight: FontWeight.bold,
        fontSize: 23
    ));

    final myIcon = Row(
      children: [
        Expanded(
          child: Column(
            children: [
              FaIcon(FontAwesomeIcons.rotate , color: Colors.teal.shade800,size: 90,),
              hr,
              Text(
                "Saisissez votre numéro de téléphone pour la reinitialisation de votre mot de passe. "
                    "Nous vous enverrons un code de reinitialisation", textAlign: TextAlign.center,
                style: GoogleFonts.ubuntu(
                  color: Colors.black.withOpacity(0.7),
                  fontSize: 14,
                ),
              ),
            ],
          ),
        )
      ],
    );

    final resetPasswordBtn = Container(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal.shade800
        ),
        onPressed: () => null,
        child: Text("REINITIALISER" ,style: GoogleFonts.ubuntu(
            color: Colors.white,
            fontWeight: FontWeight.w700
        ),),
      ),
    );

    final telephone = IntlPhoneField(
      decoration: const InputDecoration(
          labelText: 'Entrer votre numéro de téléphone',
          labelStyle: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.grey
          ),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.teal,
                  width: 2
              )
          ),
      ),
      initialCountryCode: 'CI',
      controller: customerPhone,
      onChanged: (phone) {
        //controller.phoneNumberController(phone.number);
        //controller.countryCode(phone.countryISOCode);
      },
      keyboardType: TextInputType.phone,
      invalidNumberMessage: "Mauvais format du numéro",
      countries: countries,
      // ignore: deprecated_member_use
    );

    return Scaffold(
      appBar: AppBar(
        title: title,
      ),
      body: SingleChildScrollView(
        padding:EdgeInsets.only(left: 10 , right: 10),
        child: Column(
          children: [
            space,
            myIcon,
            hr,
            telephone,
            hr,
            resetPasswordBtn,
          ],
        ),
      ),
    );
  }
}
