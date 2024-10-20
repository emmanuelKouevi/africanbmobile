import 'package:africanbus_mobile/app/login/services/login_service.dart';
import 'package:africanbus_mobile/app/login/views/login_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../custom_widgets/custom_text_form_field.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}): super(key: key);
  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {

  bool isLoading = false;

  TextEditingController nom = new TextEditingController();
  TextEditingController prenom = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController username = new TextEditingController();
  TextEditingController tel = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController confirmPassword = new TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    final defaultTextStyle =  GoogleFonts.ubuntuCondensed(
        color: Colors.black
    );

    final linkTextStyle = GoogleFonts.ubuntuCondensed(
        color:Colors.teal.shade900, fontSize: 16, fontWeight: FontWeight.bold
    );

    final titleSignUp = Container(
        child: Column(
          children: [
            Row(
              children: [
                Text("Ouvrir un compte" , style: GoogleFonts.akshar(
                    fontWeight: FontWeight.bold,
                    color: Colors.black.withOpacity(0.7),
                    fontSize: 30,
                    wordSpacing: 1
                ),)
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Text("Créez-vous un compte voyageur pour bénéficier pleinement des fonctionnalités de la plateforme." , style: GoogleFonts.asap(
                      color: Colors.black, fontWeight: FontWeight.w600),
                  ),
                )
              ],
            )
          ],
        )
    );


    final name = Container(
      child: CustomTextFormField(
        controller: nom, icon: Icons.person,
        key: Key("nameField"), labelText: "Votre Nom",
        isOutlined: false, enabled: true,
      ),
    );

    final surname = Container(
      child: CustomTextFormField(
        labelText: "Votre prénom", key: Key("surnameField"),
        icon: Icons.person_add, controller: prenom,
        enabled: true, isOutlined: false,
      ),
    );

    final motDePasse = Container(
      child: CustomTextFormField(
        isPasswordField: true, labelText: "Mot de passe",
        key: Key("passwordField"), icon: Icons.verified_user,
        controller: password, enabled: true,
        isOutlined: false,
      ),
    );

    final confirmerMotDePasse = Container(
      child: CustomTextFormField(
        isPasswordField: true, labelText: "Confirmation",
        key: Key("confirmPassword"), icon: Icons.verified_user,
        controller: confirmPassword, enabled: true,
        isOutlined: false,
      ),
    );

    final mail = Container(
      child: CustomTextFormField(
          labelText: "E-mail", key: Key("mailField"),
          icon: Icons.email, controller: email,
          enabled: true, isEmailField: true,
          isOutlined : false
      ),
    );


    final pseudo = Container(
      child: CustomTextFormField(
          labelText: "Pseudo", key: Key("pseudoField"),
          icon: Icons.person_add_alt_outlined, controller: username,
          enabled: true, isEmailField: false,
          isOutlined : false
      ),
    );



    final inscriptionBtn = Container(
      width: MediaQuery.of(context).size.width,
      //height: MediaQuery.of(context).size.height/30,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal.shade900.withOpacity(0.7),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          ),
          onPressed: () async {
            if(confirmPassword.text != password.text){
              Get.snackbar("Erreur", "Le code de confirmation est différent du mot de passe" , backgroundColor: Colors.red , colorText: Colors.white);
            }
            if(_formKey.currentState!.validate()){
              setState(() {
                isLoading = true;
              });
              final registrationMode = await AuthentificationService().toRegister(nom.text, prenom.text, username.text, email.text);
              if(registrationMode == true){
                setState(() {
                  isLoading = false;
                });
                Get.offAll(LoginView());
              }
            }
          },
          child: Text("Ouvrir un compte".toUpperCase(), style: TextStyle(
              color: Colors.white
          ),)
      ),
    );

    final haveAlreadyAnAccount = Container(
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
      key: _formKey,
      child: Column(
        children: [
          name,
          hr,
          surname,
          hr,
          mail,
          hr,
          pseudo,
          hr,
          motDePasse,
          hr,
          confirmerMotDePasse,
        ],
      ),
    );

    final space = SizedBox(height: 15);

    final loading = Center(
      child: SpinKitFadingCircle(
        size: 35, color: Colors.teal.shade900,
      ),
    );

    final iconBack = IconButton(
        onPressed: () => Navigator.pop(context),
        icon: FaIcon(FontAwesomeIcons.arrowLeft, color: Colors.black, size: 20,),
    );

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 30, right: 20, left: 20, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            iconBack,
            space,
            titleSignUp,
            SizedBox(height: 10,),
            hr,
            form,
            hr,
            isLoading == true ? loading : inscriptionBtn,
            hr,
            haveAlreadyAnAccount
          ],
        ),
      ),
    );
  }
}
