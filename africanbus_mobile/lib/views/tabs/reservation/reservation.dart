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

    final gareDepart = TextField(
      cursorColor: Colors.teal,
      decoration: InputDecoration(
          hintText: "Gare de départ",
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
            expandedHeight: 250,
            backgroundColor: Colors.teal,
            backwardsCompatibility: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                child: Column(
                  children: [],
                ),
              ),
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
