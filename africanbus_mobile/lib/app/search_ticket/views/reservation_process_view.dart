import 'package:africanbus_mobile/app/search_ticket/controllers/search_ticket_controller.dart';
import 'package:africanbus_mobile/presentations/dialog/infos_passagers_section_dialog.dart';
import 'package:africanbus_mobile/presentations/dialog/payment_type_choice.dart';
import 'package:africanbus_mobile/presentations/dialog/reservation_section_dialog.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ReservationProcess extends GetView {
  const ReservationProcess({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    final title1 = Row(
      children: [
        MaterialButton(
          onPressed: () => Get.back(),
          child: FaIcon(
            FontAwesomeIcons.arrowLeft,
            color: Colors.black,
            size: 25,
          ),
        ),
        Text("Reserver votre billet ici" .toUpperCase(), style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),)
      ],
    );

    final infosReservationPanel = GestureDetector(
      onTap: () => Get.dialog(ReservationSectionDialog() , barrierDismissible: false),
      child: Card(
        elevation: 4,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(top: 30 , left: 10 , right: 10 , bottom: 30),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("DETAIL DE LA RESERVATION".toUpperCase(), style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16
                  ),),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Veuillez ajouter les informations manquantes", style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.blueGrey
                    ),)
                  ]
              ),
              SizedBox(height: 10,)
            ],
          ),
        ),
      ),
    );

    final infosPassagersPanel = GestureDetector(
      onTap: () => Get.dialog(InfosPassagerSectionDialog(), barrierDismissible: false),
      child: Card(
        elevation: 4,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(top: 30 , left: 10 , right: 10 , bottom: 30),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Informations Passagers".toUpperCase(), style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                  ),),
                  TextButton(
                      onPressed: null,
                      child: Text("AJOUTER" , style: TextStyle(
                          color: Colors.teal.shade900,
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                      ),)
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("emmanuelHerveKouevi@gmail.com", style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.black
                  ),),
                ]
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Emmanuel Herve", style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.black
                  ),),
                  Text("Kouevi", style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.black
                  ),),
                ],
              )
            ],
          ),
        ),
      ),
    );

    final optionBagages = GestureDetector(
      child: Card(
        elevation: 4,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(top: 30 , left: 10 , right: 10 , bottom: 30),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("OPTIONS BAGAGES".toUpperCase(), style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16
                  ),),
                ],
              ),
              SizedBox(height: 15,),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Pour Adulte" , style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500
                    ),),
                    Text("|", style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500
                    ),),
                    Text("Un sac à dos:", style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500
                    ),),
                    Text("10 kg", style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500
                    ),),
                  ]
              ),
              SizedBox(height: 15,),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Pour Enfant" , style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500
                    ),),
                    Text("|", style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500
                    ),),
                    Text("Un sac de voyage:", style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500
                    ),),
                    Text("2 x 13.5 kg", style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500
                    ),),
                  ]
              ),
              SizedBox(height: 10,)
            ],
          ),
        ),
      ),
    );

    final resume = GestureDetector(
      child: Card(
        elevation: 4,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(top: 30 , left: 10 , right: 10 , bottom: 30),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("RESUME".toUpperCase(), style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16
                  ),),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Depart :" , style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),),
                    Text("Abidjan" , style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 20
                    ),),
                    Text("08h35" ,style: TextStyle(
                    color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 20
                    ),),
                  ]
              ),
              SizedBox(height: 15,),
              Divider(height: 20, thickness: 2,),
              SizedBox(height: 15,),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Arrivée :" , style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),),
                    Text("Bouaflé" , style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 20
                    ),),
                    Text("10h25" ,style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 20
                    ),),
                  ]
              ),
              SizedBox(height: 10,)
            ],
          ),
        ),
      ),
    );

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 60 , left: 10 , right: 10),
        child: Column(
          children: [
            title1,
            SizedBox(height: 10,),
            infosReservationPanel,
            SizedBox(height: 10,),
            infosPassagersPanel,
            SizedBox(height: 10,),
            optionBagages,
            SizedBox(height: 10,),
            resume
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height/9,
        margin: EdgeInsets.only(left: 10 , right: 10),
        child: Column(
          children: [
            SizedBox(height: 10,),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("TOTAL:" ,style: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                  ),),
                  Text('23500 FRANCS CFA' , style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                  ),)
                ],
              ),
            ),
            SizedBox(height: 10,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal.shade900
              ),
              onPressed:() async{
                //SearchTicketController().checkingToken();

                SearchTicketController().update();
                Get.to(PaymentChoice());
              },
              child: Text("PROCEDER À LA RESERVATION" , style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),),
            ),
          ],
        ),
      ),
    );
  }
}
