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
          prefixIcon: Icon(Icons.email , color: Colors.teal,)
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
          prefixIcon: Icon(Icons.email , color: Colors.teal,)
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

    final passwordConfirm = TextField(
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

    final registerBtn = Container(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Colors.teal
          ),
          onPressed: () => print('Bonjour'),
          child: Text("Créer un compte")
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

            spacer,
            registerBtn,
            spacer,

            spacer,

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

          ],
        ),
      ),
    );
  }
}
