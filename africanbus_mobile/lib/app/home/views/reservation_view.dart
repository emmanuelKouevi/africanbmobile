import 'package:africanbus_mobile/custom_widgets/custom_dot.dart';
import 'package:africanbus_mobile/custom_widgets/custom_field_search.dart';
import 'package:africanbus_mobile/custom_widgets/custom_simple_text_field.dart';
import 'package:africanbus_mobile/custom_widgets/custom_textfield_icon.dart';
import 'package:africanbus_mobile/presentations/dialog/gare_depart_dialog.dart';
import 'package:africanbus_mobile/presentations/dialog/travellers_selected_dialog.dart';
import 'package:africanbus_mobile/views/searchTicket/searchTicket.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
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

  TextEditingController customerController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final hr = SizedBox(height: 20.0);

    final title = Container(
      padding: EdgeInsets.only(left: 15),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Explorez,", style: GoogleFonts.notoSans(
                fontSize: 27,
                fontWeight: FontWeight.bold,
                color: Colors.black.withOpacity(0.8)
              )),
              Text("Recherchez vos billets", style: GoogleFonts.notoSans(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                  color: Colors.black.withOpacity(0.8)
              )),
            ],
          ),
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
            locale: Locale("fr" , "Fr")
          );
          if (pickedDate != null) {
            String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
            setState(() {
              dateAllerInput.text = formattedDate; //set output date to TextField value.
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
                Color(0xff273c75), Colors.teal.shade900, Colors.teal.shade800
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
          child: Text("RECHERCHER".toUpperCase(), style: TextStyle(
              color: Colors.white,
            fontWeight: FontWeight.w600,

          ),)
      ),
    );

    final changeCountryBtn = Container(
      height: MediaQuery.of(context).size.height/25,
      width: MediaQuery.of(context).size.width/11,
      margin: EdgeInsets.only(left: 25),
      decoration: BoxDecoration(
        color: Colors.white38,
        borderRadius: BorderRadius.circular(10)
      ),
      child: GestureDetector(
        onTap: () {
          var departureField = depart.text ;
          var destinationField = destination.text ;
          setState(() {
            depart.text = destinationField ;
            destination.text = departureField ;
          });
        },
        child: SvgPicture.asset('assets/svg_icons/exchange_vertical.svg',
          height: 30,
          color: Colors.teal.shade900.withOpacity(0.6),
        ),
      ),
    );

    final pointA = CustomDot(
        assetTitle: 'assets/svg_icons/dot.svg',
        color: Colors.blueGrey
    );

    final pointB = CustomDot(
        assetTitle: 'assets/svg_icons/dot.svg',
        color: Colors.green
    );

    final stationA = CustomFieldSearch(
      onTap: () => Get.dialog(GareDepartDialog(villeGareDepart: depart)),
      controller: depart,
        icon: Container(),
        label: "De"
    );

    final stationB = CustomFieldSearch(
        onTap: () => Get.dialog(GareDepartDialog(villeGareDepart: destination)),
        controller: destination,
        icon: Container(),
        label: "Vers"
    );

    final dayForTravel = CustomTextFieldIcon(
      controller: dateAllerInput,
      onTap: () async{
        DateTime? pickedDate = await showDatePicker(
            context: context, initialDate: DateTime.now(),
            firstDate: DateTime(1950),
            lastDate: DateTime(2100),
          locale: const Locale('fr' , "FR"),
        );
        if (pickedDate != null) {
          String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
          setState(() {
            dateAllerInput.text = formattedDate; //set output date to TextField value.
          });
        } else {}
      },
      icon: Icon(Icons.calendar_month_sharp , color: Colors.blueGrey, size: 25,),
      label: 'Depart le :',
    );

    final persons = CustomTextFieldIcon(
      controller: customerController,
      onTap: () => null,
      icon: Icon(Icons.person , color: Colors.blueGrey, size: 25,),
      label: 'Voyageurs:',
    );

    final card = Container(
      padding: EdgeInsets.only(left: 10, right: 10 ),
      width: MediaQuery.of(context).size.width,
      child: Card(
        color: Colors.white,
        elevation: 2,
        child: Row(
          children: [
            Column(
              children: [
                hr,
                Row(
                  children: [
                    pointA,
                    SizedBox(width: 5,),
                    stationA
                  ],
                ),
                hr,
                Row(
                  children: [
                    pointB,
                    SizedBox(width: 5,),
                    stationB
                  ],
                ),
                hr
              ],
            ),
            changeCountryBtn,
          ],
        ),
      ),
    );

    final dateCard = Container(
      width: MediaQuery.of(context).size.width/1,
      height: MediaQuery.of(context).size.height/15,
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Card(
        elevation: 2,
        child: dayForTravel
      ),
    );

    final personCard = Container(
      width: MediaQuery.of(context).size.width/1,
      height: MediaQuery.of(context).size.height/15,
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Card(
          elevation: 2,
          child: persons
      ),
    );

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 50),
        child: Column(
          children: [
            title,
            hr,
            card,
            SizedBox(height: 10,),
            dateCard,
            SizedBox(height: 10,),
            personCard,
            hr,
            searchTicketBtn,
          ],
        ),
      ),
    );
  }
}
