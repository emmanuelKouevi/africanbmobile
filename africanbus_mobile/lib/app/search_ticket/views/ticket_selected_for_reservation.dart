import 'package:africanbus_mobile/app/search_ticket/views/reservation_process_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../data/models/ticket.dart';

class TicketListSelected extends GetView{
  const TicketListSelected(this.ticketList, {Key? key}):super(key: key);
  final List<Billet> ticketList ;
  @override
  Widget build (BuildContext context){

    final listOfTicketSelected = ListView.builder(
      padding: EdgeInsets.only(top: 30 , left: 15 , right: 10),
        itemCount: ticketList.length,
        itemBuilder: (context, index) => Column(
          children: [
            returnCardTicketSelected(index)
          ],
        ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("VOS BILLETS DE VOYAGES", style: TextStyle(
          color: Colors.black.withOpacity(0.4),
          fontSize: 20,
          fontWeight: FontWeight.bold
        ),),
        centerTitle: true,
      ),
      body: listOfTicketSelected,
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal.shade900,
          ),
          onPressed: (){
            Get.to(ReservationProcess());
          },
          child: Text("FAIRE MA RESERVATION", style: TextStyle(
            color: Colors.white,
          ),),
        ),
      ),
    );
  }

  Widget returnCardTicketSelected(int index){
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
                    child: Text(ticketList[index].heureDepart , style: TextStyle(
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
                    child: Text(ticketList[index].depart , style: TextStyle(
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
                    child: Text(ticketList[index].heureArrivee, style: TextStyle(
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
                    child: Text(ticketList[index].destination , style: TextStyle(
                        fontSize: 15
                    ),),
                  ),
                ],
              ),
            ],
          ),
          Text(ticketList[index].coutReservation.toString() + ' ' + 'FCFA' , style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w500
          ),)
        ],
      ),
    );

    return Container(
      padding: EdgeInsets.only(bottom: 20),
      child: Card(
        child: Column(
          children: [
            infosTravel,
            SizedBox(height: 15,)
          ],
        ),
      ),
    );
  }
}