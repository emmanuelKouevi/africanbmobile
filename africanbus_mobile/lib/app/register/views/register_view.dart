import 'package:africanbus_mobile/app/login/views/login_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../custom_widgets/custom_text_form_field.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}): super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  TextEditingController nom = new TextEditingController();
  TextEditingController prenom = new TextEditingController();
  TextEditingController pseudo = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController tel = new TextEditingController();
  @override
  Widget build(BuildContext context) {

    final defaultTextStyle = TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.w600,
    );

    final linkTextStyle = TextStyle(
      color: Colors.teal.shade900,
      fontWeight: FontWeight.w600,
    );

    final titleSignUp = Container(
      child: Column(
        children: [
            Row(
              children: [
                Text("Ouvrir un compte" , style: GoogleFonts.roboto(
                  fontWeight: FontWeight.bold,
                  color: Colors.black.withOpacity(0.7),
                  fontSize: 35,
                  wordSpacing: 2
                ),)
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Text("Créez-vous un compte voyageur pour bénéficier pleinement des fonctionnalités de la plateforme." , style: GoogleFonts.ubuntu(
                    color: Colors.grey.withOpacity(0.9),
                    fontWeight: FontWeight.w600
                  ),),
                )
              ],
            )
        ],
      )
    );


    final name = Container(
      child: CustomTextFormField(
        controller: nom,
        icon: Icons.person,
        key: Key("nameField"),
        labelText: "Votre Nom",
        isOutlined: false,
        enabled: true,
      ),
    );

    final surname = Container(
      child: CustomTextFormField(
        labelText: "Votre prénom",
        key: Key("surnameField"),
        icon: Icons.person_add,
        controller: prenom,
        enabled: true,
        isOutlined: false,
      ),
    );

    final password = Container(
      child: CustomTextFormField(
        isPasswordField: true,
        labelText: "Mot de passe",
        key: Key("passwordField"),
        icon: Icons.verified_user,
        controller: pseudo,
        enabled: true,
        isOutlined: false,
      ),
    );

    final confirmPassword = Container(
      child: CustomTextFormField(
        isPasswordField: true,
        labelText: "Confirmation",
        key: Key("confirmPassword"),
        icon: Icons.verified_user,
        controller: pseudo,
        enabled: true,
        isOutlined: false,
      ),
    );

    final mail = Container(
      child: CustomTextFormField(
        labelText: "E-mail",
        key: Key("mailField"),
        icon: Icons.email,
        controller: email,
        enabled: true,
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
      controller: tel,
      onChanged: (phone) {
        //controller.phoneNumberController(phone.number);
        //controller.countryCode(phone.countryISOCode);
      },
      keyboardType: TextInputType.phone,
      invalidNumberMessage: "Mauvais format du numéro",
      countries: countries,
      // ignore: deprecated_member_use
    );

    final inscriptionBtn = Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height/30,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal.shade900,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          onPressed: () {
            print("Bonjour");
          },
          child: Text("Ouvrir un compte".toUpperCase(), style: TextStyle(
              color: Colors.white
          ),)
      ),
    );

    final dontHaveAnAccount = Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 40.0),
      child: RichText(
        key: Key("registerRouter"),
        text: TextSpan(
          text: "Vous avez déja un compte ? ",
          style: defaultTextStyle,
          children: <TextSpan>[
            TextSpan(
              text: 'Connectez-vous ?',
              style: linkTextStyle,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Get.to(LoginView());
                },
            ),
          ],
        ),
      ),
    );

    final hr = SizedBox(height: 15,);

    final form = Form(
      child: Column(
        children: [
          name,
          hr,
          surname,
          hr,
          mail,
          hr,
          telephone,
          hr,
          password,
          hr,
          confirmPassword,
        ],
      ),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 10 , right: 10),
        child: Column(
          children: [
            titleSignUp,
            SizedBox(height: 10,),
            hr,
            form,
            hr,
            inscriptionBtn,
            hr,
            dontHaveAnAccount,
          ],
        ),
      ),
    );
  }
}
