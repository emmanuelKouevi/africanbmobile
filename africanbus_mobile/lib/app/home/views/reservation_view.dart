import 'package:africanbus_mobile/custom_widgets/custom_simple_text_field.dart';
import 'package:africanbus_mobile/presentations/dialog/travellers_selected_dialog.dart';
import 'package:africanbus_mobile/views/searchTicket/searchTicket.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ReservationTab extends StatefulWidget {
  const ReservationTab({Key? key}) : super(key: key);

  @override
  State<ReservationTab> createState() => _ReservationTabState();
}

class _ReservationTabState extends State<ReservationTab> {

  TextEditingController depart = TextEditingController();
  TextEditingController destination = TextEditingController();

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
            onPressed: () {
              var departureField = depart.text ;
              var destinationField = destination.text ;
              setState(() {
                depart.text = destinationField ;
                destination.text = departureField ;
              });

            },
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
              backgroundColor: Colors.teal
          ),
          onPressed: () => Get.to(const SearchTicket()),
          child: Text("RECHERCHER" , style: TextStyle(
              color: Colors.white

          ),)
      ),
    );

    final passagers = Container(
        width: MediaQuery.of(context).size.width/1.1,
        child: GestureDetector(
          onTap: () => Get.dialog(
              Center(child: TypePassagerDialog())),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(
                'assets/svg_icons/passager.svg', width: 50,
                color: Colors.teal.shade900,

              ),
              Row(
                children: [
                  Text("1 Adulte" , style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20
                  ),),
                  Icon(Icons.arrow_circle_right, color: Colors.teal.shade900,)
                ],
              ),
            ],
          ),
        )
    );

    final gareDepart = Container(
      width: MediaQuery.of(context).size.width/1.05,
      child: CustomSimpleTextField(
        labelText: "Départ",
        controller: depart,
        onTap: () => null,
        enabled: true,
        key: Key('depart'),
        isOutlined: true,
      ),
    );

    final gareRetour = Container(
      width: MediaQuery.of(context).size.width/1.05,
      child: CustomSimpleTextField(
        labelText: "Arrivée",
        controller: destination,
        onTap: () => null,
        enabled: true,
        key: Key('destination'),
        isOutlined: true,
      ),
    );

    /*final gareDepart = Container(
      margin: EdgeInsets.only(left: 15 , right: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Colors.white24
      ),
      child: TextField(
        controller: depart,
        autofocus: false,
        showCursor: false,
        onTap: () {
          DialogService().showSelectCityDepartureTravelDialog(context , depart);
        },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 14.0),
          //border: InputBorder.none,
          hintText: 'Depart',
          hintStyle:TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black26
          )
        ),
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black
        ),
      )
    );*/

    /*final gareRetour = Container(
      margin: EdgeInsets.only(left: 15 , right: 30),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.white24
      ),
        child: TextField(
          controller: destination,
          autofocus: false,
          showCursor: false,
          onTap: () {
            DialogService().showSelectCityDestinationTravelDialog(context , destination);
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
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white70
          ),
        )
    );*/

    final jourDeDepart = Container(
      width: MediaQuery.of(context).size.width/2,
      padding: EdgeInsets.only(left: 10, right: 10),
      child: CustomSimpleTextField(
        key: Key('dateAllerDebut'),
        controller: dateAllerInput,
        labelText: "Date de depart",
        enabled: true,
        isOutlined: true,
        onTap:() => print("Bonjour"),
      ),
    );

    final jourDeRetour = Container(
      width: MediaQuery.of(context).size.width/2,
      padding: EdgeInsets.only(left: 10, right: 10),
      child: CustomSimpleTextField(
        key: Key('dateRetour'),
        controller: dateAllerInput,
        labelText: "Date de depart",
        enabled: true,
        isOutlined: true,
        onTap:() => print("Bonjour"),
      ),
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
          print(pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
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
            context: context, initialDate: DateTime.now(),
            firstDate: DateTime(1950), //DateTime.now() - not to allow to choose before today.
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



    final searchTicketBtn = Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Color(0xff273c75),
                Colors.teal.shade700,
                Colors.teal
              ]
          )
      ),
      width: MediaQuery.of(context).size.width/1.1,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent.withOpacity(0.0),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
          ),
          onPressed: () => Get.to(SearchTicket()),
          child: Text("RECHERHCHER".toUpperCase(), style: TextStyle(
              color: Colors.white
          ),)
      ),
    );

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 60),
        child: Column(
          children: [
            gareDepart,
            SizedBox(height: 20),
            gareRetour,
            SizedBox(height: 20),
            Row(
              children: [
                jourDeDepart,
                jourDeRetour,
              ],
            ),
            SizedBox(height: 30),
            passagers,
            SizedBox(height: 30),
            searchTicketBtn
            //jourAller,
            //jourRetour
          ],
        ),
      ),
      /*body: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: true,
            pinned: _pinned,
            snap: _snap,
            floating: _floating,
            expandedHeight: MediaQuery.of(context).size.height/3,
            backgroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: EdgeInsets.only(top: 60),
                child: Container(
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
      ),*/
    );
  }
}
