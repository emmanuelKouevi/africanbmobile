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
  @override
  Widget build(BuildContext context) {

    final defaultTextStyle = TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.w600,
    );

    final linkTextStyle = TextStyle(
      color: Colors.teal,
      fontWeight: FontWeight.w600,
    );


    final spacer = SizedBox(height: 20.0);
    
    final title1 = Container(
      margin: EdgeInsets.only(left: 80 , bottom: 70),
      child: Text(
          "AFRICANBUS",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.teal,
          fontSize: 30
        ),
      ),
    );

    final title2 = Text(
        "Connectez-vous à votre compte.",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.black.withOpacity(0.6)
        ),
    );

    final forgotPassword = Container(
      margin: EdgeInsets.only(top: 20.0),
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () => Navigator.of(context).pushNamed(tabsViewRoute),
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

    final email = TextField(

      decoration: InputDecoration(
          labelText: "E-mail ou Pseudo",
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
          ),
          prefixIcon: Icon(Icons.email)
      ),
    );

    final password = TextField(
      decoration: InputDecoration(
        labelText: "Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        prefixIcon: Icon(Icons.lock)
      ),
    );


    final connexionBtn = Container(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.teal
        ),
          onPressed: () => print('Bonjour'),
          child: Text("Connexion")
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
              Navigator.of(context).pushNamed(tabsViewRoute);
            },
          children: <TextSpan>[
            TextSpan(
              text: 'Inscrivez-vous ?',
              style: linkTextStyle,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.of(context).pushNamed(tabsViewRoute);
                },
            ),
          ],
        ),
      ),
    );

    final form = Form(
        child: Column(
          children: [
            spacer,
            spacer,
            email,
            spacer,
            spacer,
            password,
            forgotPassword,
            spacer,
            connexionBtn,
            spacer,
            tiersFournisseurFacebookBtn,
            spacer,
            tiersFournisseurGoogleBtn
          ],
        )
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          top: 30.0,
          bottom: 30.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            title1,
            spacer,
            spacer,
            spacer,
            title2,
            form,
            spacer,
            dontHaveAnAccount
          ],
        ),
      ),
    );
  }
}
