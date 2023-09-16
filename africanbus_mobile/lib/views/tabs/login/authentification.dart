import 'package:africanbus_mobile/custom_widgets/custom_text_form_field.dart';
import 'package:africanbus_mobile/router/router.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sign_in_button/sign_in_button.dart';

class AuthentificationTab extends StatefulWidget {
  const AuthentificationTab({Key? key}) : super(key: key);

  @override
  State<AuthentificationTab> createState() => _AuthentificationTabState();
}

class _AuthentificationTabState extends State<AuthentificationTab> {
  TextEditingController id = new TextEditingController();
  TextEditingController code = new TextEditingController();
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


    final forgotPassword = Container(
      margin: EdgeInsets.only(top: 20.0),
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () => Navigator.of(context).pushNamed(forgetPasswordViewRoute),
        child: Text(
          "Mot de passe oublié?",
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );

    final tiersFournisseurGoogleBtn = SignInButton(
        Buttons.google,
        text: "Continuer avec Google",
        onPressed: (){}
    );

    final tiersFournisseurFacebookBtn = SignInButton(
        Buttons.facebook,
        text: "Continuer avec Facebook",
        onPressed: (){}
    );

    final email = Container(
      child: CustomTextFormField(
        controller: id,
        icon: Icons.mail,
        key: Key("idField"),
        labelText: "E-mail",
        enabled: true,
      ),
    );

    final password = Container(
      child: CustomTextFormField(
        labelText: "Mot de Passe",
        key: Key("motDePasse"),
        icon: Icons.lock,
        isPasswordField: true,
        controller: code,
        enabled: true,
      ),
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
          child: Text("Connexion".toUpperCase(), style: TextStyle(
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
          text: "Vous n'avez pas de compte ? ",
          style: defaultTextStyle,
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              Navigator.of(context).pushNamed(registerViewRoute);
            },
          children: <TextSpan>[
            TextSpan(
              text: 'Inscrivez-vous ?',
              style: linkTextStyle,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.of(context).pushNamed(registerViewRoute);
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
              SizedBox(height: 80),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Bienvenue", style: TextStyle(color: Colors.white, fontSize: 40 , fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    Text("Connectez-vous à votre compte" , style: TextStyle(color: Colors.white, fontSize: 18),)
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
                              child: email,
                            ),
                            Container(
                              child: password,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 5),
                      forgotPassword,
                      SizedBox(height: 5),
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
