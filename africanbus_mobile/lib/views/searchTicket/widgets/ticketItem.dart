import 'package:africanbus_mobile/app/search_ticket/controllers/search_ticket_controller.dart';
import 'package:africanbus_mobile/app/search_ticket/views/ticket_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../app/data/models/ticket.dart';

class TicketItem extends StatefulWidget {
  final Billet ticket ;
  const TicketItem({Key? key , required this.ticket}) : super(key: key);

  @override
  State<TicketItem> createState() => _TicketItemState();
}

class _TicketItemState extends State<TicketItem> {
  @override
  Widget build(BuildContext context) {

    final searchTicketController = Get.put(SearchTicketController());

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
                    child: Text(widget.ticket.heureDepart , style: TextStyle(
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
                    child: Text(widget.ticket.depart , style: TextStyle(
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
                    child: Text(widget.ticket.heureArrivee, style: TextStyle(
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
                    child: Text(widget.ticket.destination , style: TextStyle(
                        fontSize: 15
                    ),),
                  ),
                ],
              ),
            ],
          ),
          Text(widget.ticket.coutReservation.toString() + ' ' + 'FCFA' , style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500
          ),)
        ],
      ),
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
                child: Text(widget.ticket.id , style: TextStyle(
                  //color: Colors.black.withOpacity(0.7),
                  fontSize: 15
                ),),
              ),
            ],
          ),
          Container(
            child: Text(widget.ticket.compagnieTransport, style: TextStyle(
              //color: Colors.teal.withOpacity(0.7),
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),),
          ),
        ],
      ),
    );

    final addTicketToCart = ListTile(
      leading: Text("Places restantes :  4", style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700
      ),),
      trailing: OutlinedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll<Color>(Colors.teal.shade900),
        ),
        onPressed:() {
          searchTicketController.selectTicket(widget.ticket);
          searchTicketController.update();
          Get.snackbar("Succes", "Ticket sélectionné avec succes" ,
              backgroundColor: Colors.green, colorText: Colors.white
          );
        },
        child: Icon(Icons.arrow_forward_ios_rounded , size: 30 , color: Colors.white,),
      )
    );

    final carDetails = ListTile(
      leading: Text("Bus n°715", style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700
      ),),
      trailing: TextButton(
          onPressed: () => Get.dialog(TicketDetailView(widget.ticket)),
          child: Text('Voir détail')
      )
    );


    return Container(
      padding: EdgeInsets.only(bottom: 15),
      height: MediaQuery.of(context).size.height/2.8,
      width: MediaQuery.of(context).size.width,
      child: Card(
        color: Colors.white,
        shadowColor: Colors.teal.shade900,
        elevation: 5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            infosTravel,
            SizedBox(height: 10,),
            infosOperator,
            addTicketToCart,
            carDetails
            //SizedBox(height: 1)
          ],
        ),
      ),
    );
  }
}
