import 'package:africanbus_mobile/router/router.dart';
import 'package:flutter/material.dart';

class ReservationTab extends StatefulWidget {
  const ReservationTab({Key? key}) : super(key: key);

  @override
  State<ReservationTab> createState() => _ReservationTabState();
}

class _ReservationTabState extends State<ReservationTab> {

  bool _pinned = false ;
  bool _snap = false;
  bool _floating = false;

  @override
  Widget build(BuildContext context) {

    final hr = SizedBox(height: 10.0);

    final exchangeBtn = Positioned(
      child: Container(),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Passagers" ,style: TextStyle(
            fontWeight: FontWeight.w600
          ),),
          Text("1 Adulte" , style: TextStyle(
            fontWeight: FontWeight.bold

          ),),
        ],
      )
    );

    final gareDepart = Container(
      margin: EdgeInsets.only(left: 15 , right: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Colors.white24
      ),
      child: GestureDetector(
        onTap: () => Navigator.popAndPushNamed(context, loginViewRoute),
        child: TextField(
          autofocus: true,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 14.0),
            border: InputBorder.none,
          ),
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
          autofocus: true,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 14.0),
            border: InputBorder.none,
            prefixText: 'Arrivée',
          ),
        )
    );

    final jourAller = TextField(
      cursorColor: Colors.teal,
      decoration: InputDecoration(
          hintText: "Aller",
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
          prefixIcon: Icon(Icons.calendar_today , color: Colors.teal,)
      ),
    );

    final jourRetour = TextField(
      cursorColor: Colors.teal,
      decoration: InputDecoration(
          hintText: "Retour",
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    gareDepart,
                    hr,
                    gareRetour,
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
