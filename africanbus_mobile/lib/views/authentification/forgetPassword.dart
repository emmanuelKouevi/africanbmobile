import 'package:flutter/material.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {

    final spacer = SizedBox(height: 10);

    final emailRetrieving = TextField(
      cursorColor: Colors.teal,
      decoration: InputDecoration(
          hintText: "E-mail",
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

    final sendCodeBtn = Container(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Colors.teal
          ),
          onPressed: () => print('Bonjour'),
          child: Text("ENVOYER LE CODE")
      ),
    );

    final title1 = Container(
        height: MediaQuery.of(context).size.height/4,
        margin: EdgeInsets.only(left: 65 ),
        child: Image.asset( 'assets/logo_africanbus.jpg', fit: BoxFit.cover,)
    );

    final title2 = Text(
      "Vous avez oublié votre mot de passe !",
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
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
          left: 20.0,
          right: 20.0,
          bottom: 30.0,
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
