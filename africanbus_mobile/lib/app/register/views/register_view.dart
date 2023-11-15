import 'package:africanbus_mobile/app/login/views/login_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../custom_widgets/custom_text_form_field.dart';
import '../../home/views/home_view.dart';

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


    final continueWithoutLogin = Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          "Continuer sans connexion",
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Colors.white
          ),
        ),
        IconButton(
            onPressed: () => Get.to(HomeView()),
            icon: Icon(Icons.arrow_forward, color: Colors.white,)
        )
      ],
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

    final login = Container(
      child: CustomTextFormField(
        labelText: "Votre pseudo",
        key: Key("pseudoField"),
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
      invalidNumberMessage: "Numéro de téléphone invalide",
      countries: countries,
      // ignore: deprecated_member_use
    );

    final connexionBtn = Container(
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
          onPressed: () => print('Bonjour'),
          child: Text("Inscription".toUpperCase(), style: TextStyle(
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

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [
                Color(0xff192a56),
                Colors.teal.shade700,
                Colors.teal
              ]
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30),
                    Text("Bienvenue", style: TextStyle(color: Colors.white, fontSize: 40 , fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    Text("Inscrivez-vous , ayez votre espace" , style: TextStyle(color: Colors.white, fontSize: 18),)
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(60) , topRight: Radius.circular(60)),
                ),
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      SizedBox(height: 60),
                      Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromRGBO(0, 75, 0, .3),
                                blurRadius: 20,
                                offset: Offset(0, 10)
                            )
                          ],
                        ),
                        child: Column(
                          children: [
                            Container(
                              child: name,
                            ),
                            SizedBox(height: 5),
                            Container(
                              child: surname,
                            ),
                            SizedBox(height: 5),
                            Container(
                              child: login,
                            ),
                            SizedBox(height: 5),
                            Container(
                              child: mail,
                            ),
                            SizedBox(height: 5),
                            Container(
                              child: telephone,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      connexionBtn,
                      SizedBox(height: 5),
                      dontHaveAnAccount
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
