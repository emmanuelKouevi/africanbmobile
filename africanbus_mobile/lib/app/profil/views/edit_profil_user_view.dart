import 'package:africanbus_mobile/app/login/viewmodel/login_view_model.dart';
import 'package:africanbus_mobile/custom_widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';


/*
   Date : 03-04-2024
   Auteur : Kouevi Ayite Emmanuel Hervé
   Description: Ecran permettant à un utilisateur de modifier son profil utilisateur.
 */

class EditProfilUserView extends StatefulWidget {
  const EditProfilUserView({Key? key}): super(key: key);

  @override
  State<EditProfilUserView> createState() => _EditProfilUserViewState();
}

class _EditProfilUserViewState extends State<EditProfilUserView> {

  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController userPhone = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    final loginProvider = Provider.of<LoginViewModel>(context);
    firstname.text = loginProvider.userConnected.nom;
    lastname.text = loginProvider.userConnected.prenoms;
    email.text = loginProvider.userConnected.email;
    final title = Text("Modifier mon profil", style: GoogleFonts.ubuntu(
        color: Colors.black.withOpacity(0.7),
        fontWeight: FontWeight.bold,
        fontSize: 23
    ));

    final hr = SizedBox(height: 10);

    final myIcon = Row(
      children: [
        Expanded(
          child: Column(
            children: [
              FaIcon(FontAwesomeIcons.userLarge , color: Colors.teal.shade800,size: 90,),
              hr,
              Text(
                "Vous voulez modifier vos informations personnelles ?", textAlign: TextAlign.center,
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

    final nom = Container(
      child: CustomTextFormField(
        labelText: "Votre nom",
        icon: FontAwesomeIcons.user,
        key: Key("username"),
        controller: firstname,
        enabled: false,
        isOutlined: false,
      ),
    );

    final prenoms = Container(
      child: CustomTextFormField(
        labelText: "Vos prénoms",
        icon: FontAwesomeIcons.user,
        key: Key("prenoms"),
        controller: lastname,
        enabled: false,
        isOutlined: false,
      ),
    );

    final mail = Container(
      child: CustomTextFormField(
          labelText: "E-mail",
          key: Key("mailField"),
          icon: Icons.email,
          controller: email,
          enabled: false,
          isEmailField: true,
          isOutlined : false
      ),
    );

    final telephone = IntlPhoneField(
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
      controller: userPhone,
      onChanged: (phone) {
        //controller.phoneNumberController(phone.number);
        //controller.countryCode(phone.countryISOCode);
      },
      keyboardType: TextInputType.phone,
      invalidNumberMessage: "Mauvais format du numéro",
      countries: countries,
      enabled: false,
      // ignore: deprecated_member_use
    );

    final form = Form(
      key: _formKey,
      child: Column(
        children: [
          nom,
          hr,
          prenoms,
          hr,
          mail,
          hr,
          telephone,
          hr
        ],
      ),
    );

    final editProfilUserBtn = Container(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.teal.shade800
        ),
        onPressed: () => null,
        /*onPressed: () {
          if(_formKey.currentState!.validate()){
            print("Bonjour");
          }
        },*/
        child: Text("Modifier le profil", style: GoogleFonts.ubuntu(
          color: Colors.white,
          fontWeight: FontWeight.bold
        ),),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: title,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 10 , right: 10),
        child: Column(
          children: [
            hr,
            hr,
            myIcon,
            hr,
            form,
            hr,
            editProfilUserBtn
          ],
        ),
      ),
    );
  }
}
