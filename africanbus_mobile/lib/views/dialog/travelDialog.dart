import 'package:flutter/material.dart';

class TravelDialog extends StatefulWidget {
  const TravelDialog({Key? key}) : super(key: key);

  @override
  State<TravelDialog> createState() => _TravelDialogState();
}

class _TravelDialogState extends State<TravelDialog> {
  @override
  Widget build(BuildContext context) {

    final positionOrLocalisation = Container(
      child: Row(
        children: [
          Icon(Icons.map),
          Container(
            margin: EdgeInsets.only(left: 15),
            child: Text('Mon emplacement actuel' , style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400
            ),),
          )
        ],
      ),
    );

    final returnBtn = Stack(
      children: [
        Positioned(
          child: MaterialButton(
              color: Colors.grey.withOpacity(0.9),
              shape: CircleBorder(),
              onPressed: () => Navigator.pop(context),
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
          ),
          )
        ),
      ],

    );

    final departureCity = Container(
      child: TextField(
        showCursor: false,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.teal,
              )
          ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.teal,
                    width: 3
                )
            ),
            labelText: 'De',
            labelStyle: TextStyle(
              color: Colors.teal
            )
        ),
      ),
    );

    final destinationCity = Container(
      child: TextField(
        showCursor: false,
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.teal,
                )
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.teal,
                width: 3
              )
            ),
          labelText: 'À',
            labelStyle: TextStyle(
                color: Colors.teal
            )
        ),
      ),
    );

    final hr = SizedBox(height: 5);

    final section = Container(
      margin: EdgeInsets.only(left: 40 , right: 30),
      child: Column(
        children: [
          departureCity,
          hr,
          destinationCity,
          hr,
          hr,
          hr,
          positionOrLocalisation
        ],
      ),
    );

    return Container(
      margin: EdgeInsets.only(top: 15),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                returnBtn
              ],
            ),
            hr,
            hr,
            section,
          ],
        ),
      ),
    );
  }
}
