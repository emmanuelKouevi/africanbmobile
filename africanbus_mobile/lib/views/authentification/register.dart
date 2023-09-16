import 'package:africanbus_mobile/router/router.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
      "Nouveau compte utilisateur.",
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.black.withOpacity(0.6)
      ),
    );

    final nom = TextField(
      cursorColor: Colors.teal,
      decoration: InputDecoration(
          hintText: "Nom",
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
          prefixIcon: Icon(Icons.person , color: Colors.teal,)
      ),
    );

    final prenom = TextField(
      cursorColor: Colors.teal,
      decoration: InputDecoration(
          hintText: "Prenom",
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
          prefixIcon: Icon(Icons.person_add, color: Colors.teal,)
      ),
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
          hintText: "Mot de passe",
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

    final passwordConfirm = TextField(
      cursorColor: Colors.teal,
      decoration: InputDecoration(
          hintText: "Confirmer le mot de passe",
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
          prefixIcon: Icon(Icons.verified_user , color: Colors.teal,)
      ),
    );

    final registerBtn = Container(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal
          ),
          onPressed: () => print('Bonjour'),
          child: Text("Créer un compte")
      ),
    );

    final haveAnAccount = Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 40.0),
      child: RichText(
        key: Key("registerRouter"),
        text: TextSpan(
          text: "Vous avez déja un compte ? ",
          style: defaultTextStyle,
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              Navigator.of(context).pushNamed(loginViewRoute);
            },
          children: <TextSpan>[
            TextSpan(
              text: 'Connectez-vous ?',
              style: linkTextStyle,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.of(context).pushNamed(loginViewRoute);
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
                      SizedBox(height: 5),
                      registerBtn,
                      SizedBox(height: 5),
                      haveAnAccount
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
