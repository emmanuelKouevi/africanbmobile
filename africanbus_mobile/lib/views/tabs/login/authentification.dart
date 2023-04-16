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
      height: MediaQuery.of(context).size.height/4,
      margin: EdgeInsets.only(left: 65 ),
      child: Image.asset( 'assets/logo_africanbus.jpg', fit: BoxFit.cover,)
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
      cursorColor: Colors.teal,
      decoration: InputDecoration(
          hintText: "E-mail ou pseudo",
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.teal),
            borderRadius: BorderRadius.circular(20.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.teal , width: 2),
            borderRadius: BorderRadius.circular(20.0),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          prefixIcon: Icon(Icons.email , color: Colors.teal,)
      ),
    );

    final password = TextField(
      cursorColor: Colors.teal,
      decoration: InputDecoration(
        hintText: "Password",
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.teal),
          borderRadius: BorderRadius.circular(20.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.teal , width: 2),
          borderRadius: BorderRadius.circular(20.0),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        prefixIcon: Icon(Icons.lock , color: Colors.teal,)
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

    final form = Form(
        child: Column(
          children: [
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
          bottom: 30.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            title1,
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
