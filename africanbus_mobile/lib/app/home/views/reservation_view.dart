import 'package:africanbus_mobile/app/home/repository/reservation_reporitory.dart';
import 'package:africanbus_mobile/custom_widgets/custom_dot.dart';
import 'package:africanbus_mobile/custom_widgets/custom_field_search.dart';
import 'package:africanbus_mobile/custom_widgets/custom_textfield_icon.dart';
import 'package:africanbus_mobile/presentations/dialog/gare_depart_dialog.dart';
import 'package:africanbus_mobile/presentations/dialog/gare_destination_dialog.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../search_ticket/views/search_ticket.dart';
import '../controllers/home_controller.dart';


class ReservationTab extends StatefulWidget {
  const ReservationTab({Key? key}) : super(key: key);

  @override
  State<ReservationTab> createState() => _ReservationTabState();
}

class _ReservationTabState extends State<ReservationTab> {
  
  TextEditingController depart = TextEditingController();
  TextEditingController destination = TextEditingController();

  TextEditingController dateAllerInput = TextEditingController();
  TextEditingController customerController = TextEditingController();


  final homeController = Get.put(HomeController() , permanent: true);

  @override
  void initState(){
    depart.text = homeController.gareDepart.value;
    destination.text = homeController.gareDestination.value;
    dateAllerInput.text = homeController.dateDepart.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final reservationProvider = Provider.of<ReservationRepository>(context);

    final hr = SizedBox(height: 20.0);

    final title = Container(
      //margin: EdgeInsets.only(top: 240 , left: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () => Get.back(),
              icon: FaIcon(FontAwesomeIcons.arrowLeft, color: Colors.black,)
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width/1.3,
                child: AnimatedTextKit(
                  animatedTexts: [
                    TyperAnimatedText('Explorez et obtenez vos billets sans casse-tête.', textStyle: GoogleFonts.akshar(
                      fontWeight: FontWeight.bold, fontSize: 16
                    )),
                ],),
              )
            ],
          ),
        ],
      ),
    );

    final searchTicketBtn = Container(
      width: MediaQuery.of(context).size.width/1.1,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal.shade900.withOpacity(0.7),
          ),
          onPressed: () async{
            if(depart.text.isEmpty){
              Get.snackbar(
                  "Erreur", "La gare de départ est obligatoire !!",
                  colorText: Colors.white , backgroundColor: Color(0xfffc0392b)
              );
            }else if(destination.text.isEmpty){
              Get.snackbar(
                  "Erreur", "La gare de destination est obligatoire !!",
                  colorText: Colors.white , backgroundColor: Color(0xfffc0392b)
              );
            }else if(dateAllerInput.text.isEmpty){
              Get.snackbar(
                  "Erreur", "Veuillez sélectionner une date !!",
                  colorText: Colors.white , backgroundColor: Color(0xfffc0392b)
              );
            }else if(depart.text == destination.text){
              Get.snackbar(
                  "Erreur", "La ville de départ ne peut pas être la ville de destination !!",
                  colorText: Colors.white , backgroundColor: Color(0xfffc0392b)
              );
            }else{
              homeController.gareDepart.value = depart.text;
              homeController.gareDestination.value = destination.text;
              homeController.dateDepart.value = dateAllerInput.text;
              await reservationProvider.initializeOffreByFeatures(depart.text, destination.text, dateAllerInput.text);
              Get.to(SearchTicket());
            }
          },
          child: Text("Rechercher les offres".toUpperCase(),
              style: GoogleFonts.notoSans(fontWeight: FontWeight.w600, fontSize: 15, color: Colors.white)
          )
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
        label: "Depart"
    );

    final stationB = CustomFieldSearch(
        onTap: () => Get.dialog(GareDestinationDialog(villeGareDestination: destination)),
        controller: destination,
        icon: Container(),
        label: "Arrivée"
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
          String formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate);
          setState(() {
            dateAllerInput.text = formattedDate; //set output date to TextField value.
          });
        } else {}
      },
      icon: Icon(Icons.calendar_month_sharp , color: Colors.blueGrey, size: 25,),
      label: 'Depart le :',
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

    final pictureImage = Positioned(
        child: Container(
          height: MediaQuery.of(context).size.height/3,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/svg_icons/illustration.png"),
              fit: BoxFit.cover
            )
          ),
          //child: title,
        ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 10),
        child: Column(
          children: [
            title,
            Stack(
              children: [ pictureImage ],
            ),
            //title,
            hr,
            card,
            SizedBox(height: 10,),
            dateCard,
            SizedBox(height: 10,),
            hr,
            searchTicketBtn,
          ],
        ),
      ),
    );
  }
}
