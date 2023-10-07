import 'package:africanbus_mobile/custom_widgets/custom_simple_text_field.dart';
import 'package:africanbus_mobile/presentations/dialog/gare_depart_dialog.dart';
import 'package:africanbus_mobile/presentations/dialog/travellers_selected_dialog.dart';
import 'package:africanbus_mobile/views/searchTicket/searchTicket.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';


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

    final hr = SizedBox(height: 20.0);

    final exchangeBtn = Container(
      margin: EdgeInsets.only(right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            child: SvgPicture.asset("assets/svg_icons/exchange.svg",
                width: 30 , theme: SvgTheme( fontSize: 20 ,currentColor: Colors.teal.shade900),
            ),
            onTap: () {
              var departureField = depart.text ;
              var destinationField = destination.text ;
              setState(() {
                depart.text = destinationField ;
                destination.text = departureField ;
              });
            },
          )
        ],
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
        onTap: () => Get.dialog(GareDepartDialog(villeGareDepart: depart)),//DialogService().showSelectCityDepartureTravelDialog(context , depart),
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
        onTap: () => Get.dialog(GareDepartDialog(villeGareDepart: destination)),
        enabled: true,
        key: Key('destination'),
        isOutlined: true,
      ),
    );


    final jourDeDepart = Container(
      width: MediaQuery.of(context).size.width/2,
      padding: EdgeInsets.only(left: 10, right: 10),
      child: CustomSimpleTextField(
        key: Key('dateAllerDebut'),
        controller: dateAllerInput,
        labelText: "Date de depart",
        enabled: true,
        isOutlined: true,
        onTap:() async{
          DateTime? pickedDate = await showDatePicker(
            context: context, initialDate: DateTime.now(),
            firstDate: DateTime(1950), //DateTime.now() - not to allow to choose before today.
            lastDate: DateTime(2100),
            //locale: Locale("fr" , "Fr")
          );
          if (pickedDate != null) {
            print(pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
            String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
            print(formattedDate); //formatted date output using intl package =>  2021-03-16
            setState(() {
              dateAllerInput.text = formattedDate; //set output date to TextField value.
            });
          } else {}
        },
      ),
    );

    final jourDeRetour = Container(
      width: MediaQuery.of(context).size.width/2,
      padding: EdgeInsets.only(left: 10, right: 10),
      child: CustomSimpleTextField(
        key: Key('dateRetour'),
        controller: dateRetourInput,
        labelText: "Date de Retour",
        enabled: true,
        isOutlined: true,
        onTap:() async {
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
      ),
    );


    final searchTicketBtn = Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomCenter, end: Alignment.topCenter,
              colors: [
                Color(0xff273c75), Colors.teal.shade700, Colors.teal
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
        padding: EdgeInsets.only(top: 50),
        child: Column(
          children: [
            exchangeBtn,
            hr,
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
          ],
        ),
      ),
    );
  }
}
