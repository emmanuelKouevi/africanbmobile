import 'package:africanbus_mobile/dialogService/dialogService.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ReservationTab extends StatefulWidget {
  const ReservationTab({Key? key}) : super(key: key);

  @override
  State<ReservationTab> createState() => _ReservationTabState();
}

class _ReservationTabState extends State<ReservationTab> {

  bool _pinned = false ;
  bool _snap = false;
  bool _floating = false;

  TextEditingController dateAllerInput = TextEditingController();
  TextEditingController dateRetourInput = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final hr = SizedBox(height: 10.0);

    final exchangeBtn = Positioned(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            onPressed: () => null,
            icon: FaIcon(FontAwesomeIcons.arrowsRotate , color: Colors.white, size: 30,)
          ),
        ),
      top: 30,
      left: 325,
    );


    final searchTicket = Container(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Colors.teal
          ),
          onPressed: () => print('Bonjour'),
          child: Text("RECHERCHER")
      ),
    );

    final passagers = Container(
      width: MediaQuery.of(context).size.width,
      child: GestureDetector(
        onTap: () => DialogService().showPassagersSectionDialog(context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.person , color: Colors.black),
            Text("1 Adulte" , style: TextStyle(
              fontWeight: FontWeight.bold
            ),),
          ],
        ),
      )
    );

    final gareDepart = Container(
      margin: EdgeInsets.only(left: 15 , right: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Colors.white24
      ),
      child: TextField(
        autofocus: false,
        showCursor: false,
        onTap: () {
          DialogService().showSelectCityForTravelDialog(context);
        },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 14.0),
          border: InputBorder.none,
          hintText: 'Depart',
          hintStyle:TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black26
          )
        ),
      )
    );

    final gareRetour = Container(
      margin: EdgeInsets.only(left: 15 , right: 30),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.white24
      ),
        child: TextField(
          autofocus: false,
          showCursor: false,
          onTap: () {
            DialogService().showSelectCityForTravelDialog(context);
          },
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 14.0),
            border: InputBorder.none,
            hintText: 'Arrivée',
            hintStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black26
            )
          ),
        )
    );

    final jourAller = TextField(
      cursorColor: Colors.teal,
      controller: dateAllerInput,
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1950),
            //DateTime.now() - not to allow to choose before today.
            lastDate: DateTime(2100));

        if (pickedDate != null) {
          print(
              pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
          String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
          print(formattedDate); //formatted date output using intl package =>  2021-03-16
          setState(() {
            dateAllerInput.text = formattedDate; //set output date to TextField value.
          });
        } else {}
      },
      decoration: InputDecoration(
          hintText: "Date de départ",
          isDense: false,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.teal
            )
          ),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.teal,
                  width: 3
              )
          ),
          prefixIcon: Icon(Icons.calendar_today , color: Colors.teal,)
      ),
    );

    final jourRetour = TextField(
      cursorColor: Colors.teal,
      controller: dateRetourInput,
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1950),
            //DateTime.now() - not to allow to choose before today.
            lastDate: DateTime(2100));

        if (pickedDate != null) {
          print(pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
          String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
          print(formattedDate); //formatted date output using intl package =>  2021-03-16
          setState(() {
            dateRetourInput.text = formattedDate; //set output date to TextField value.
          });
        } else {}
      },
      decoration: InputDecoration(
          hintText: "Date de retour",
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.teal
              )
          ),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.teal,
                  width: 3
              )
          ),
          prefixIcon: Icon(Icons.calendar_today, color: Colors.teal,)
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text("RÉSERVATION DE BILLETS",style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15
            ),),
            centerTitle: true,
            pinned: _pinned,
            snap: _snap,
            floating: _floating,
            expandedHeight: MediaQuery.of(context).size.height/4,
            backgroundColor: Colors.teal,
            backwardsCompatibility: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: EdgeInsets.only(top: 60),
                child: Stack(
                  children: [
                    exchangeBtn,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        gareDepart,
                        hr,
                        gareRetour,
                      ],
                    )
                  ],
                ),
              )
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0)
                  )
              ),
              margin: EdgeInsets.only(top: 20 , right: 10 , left: 10),
              child: Column(
                children: [
                  hr,
                  jourAller,
                  hr,
                  jourRetour,
                  hr,
                  hr,
                  passagers,
                  hr,
                  searchTicket
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
