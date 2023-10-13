import 'package:africanbus_mobile/app/data/models/ticket.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class TicketDetailView extends GetView{
  const TicketDetailView(this.billet, { Key? key }) : super(key:key);
  final Billet billet;

  Widget build (BuildContext context){

    final hr = SizedBox(height: 25,);

    final title1 = Row(
      children: [
        MaterialButton(
            onPressed: () => Get.back(),
          child: FaIcon(FontAwesomeIcons.arrowLeft, color: Colors.black,size: 35,),
        ),
        Text("DETAIL DU BILLET", style: TextStyle(
          color: Colors.black,
          fontSize: 25,
          wordSpacing: 5,
          fontWeight: FontWeight.bold

        ),)
      ],
    );

    final infosOperator = Container(
      padding: EdgeInsets.only(left: 15, right: 15),
      alignment: Alignment.center,
      /*decoration: BoxDecoration(
        color: Colors.white70
      ),*/
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                child: Text('Ref : ' , style: TextStyle(
                    fontWeight: FontWeight.bold
                ),),
              ),
              Container(
                child: Text(billet.id , style: TextStyle(
                  //color: Colors.black.withOpacity(0.7),
                    fontSize: 15
                ),),
              ),
            ],
          ),
          Container(
            child: Text(billet.compagnieTransport, style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),),
          ),
        ],
      ),
    );

    final infosTravel = Container(
      margin: EdgeInsets.only(left: 10 , right: 10 , top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 25),
                    child: Text(billet.heureDepart , style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25
                    ),),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    child: Text('Départ', style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700
                    ),),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    child: Text(billet.depart , style: TextStyle(
                        fontSize: 15
                    ),),
                  ),
                ],
              ),
              Container(
                  margin: EdgeInsets.only(bottom: 50),
                  child: FaIcon(FontAwesomeIcons.arrowRight, size: 15,)
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 25),
                    child: Text(billet.heureArrivee, style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold,
                        fontSize: 25
                    ),),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    child: Text('Arrivée' , style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700
                    ),),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    child: Text(billet.destination , style: TextStyle(
                        fontSize: 15
                    ),),
                  ),
                ],
              ),
            ],
          ),
          Text(billet.coutReservation.toString() + ' ' + 'FCFA' , style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w500
          ),)
        ],
      ),
    );

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 30 , left: 10 , right: 10),
        child: Column(
          children: [
            title1,
            hr,
            Card(
              elevation: 3,
              child: Column(
                children: [
                  infosTravel,
                  hr,
                  infosOperator,
                  SizedBox(height: 15,),
                  Divider(),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      FaIcon(FontAwesomeIcons.chair , color: Colors.teal.shade900,),
                      FaIcon(FontAwesomeIcons.phone , color: Colors.teal.shade900,),
                      FaIcon(FontAwesomeIcons.wifi , color: Colors.teal.shade900,)
                    ],
                  ),
                  SizedBox(height: 15,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}