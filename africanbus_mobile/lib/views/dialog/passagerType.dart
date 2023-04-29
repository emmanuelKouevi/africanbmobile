import 'package:flutter/material.dart';

class PassagersType extends StatefulWidget {
  const PassagersType({Key? key}) : super(key: key);

  @override
  State<PassagersType> createState() => _PassagersTypeState();
}

class _PassagersTypeState extends State<PassagersType> {
  @override
  Widget build(BuildContext context) {

    const hr = SizedBox(height: 10);

    return AlertDialog(
      title: Text('Choisissez le type de passager' , style: TextStyle(
        fontSize: 18,
      ),),
      content: SingleChildScrollView(
        child: ListBody(
          children: const <Widget>[
            Text('Enfants'),
            hr,
            Text('Adultes'),
          ],
        ),
      ),
    );
  }
}
