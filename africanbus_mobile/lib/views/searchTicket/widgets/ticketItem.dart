import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

    final infosTravel = Container(
      decoration: BoxDecoration(
        color: Colors.white70
      ),
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
                    child: Text(''),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    child: Text(widget.ticket.depart , style: TextStyle(
                      color: Colors.grey,
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
                    child: Text('Arrivé' , style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700
                    ),),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    child: Text(widget.ticket.destination , style: TextStyle(
                        color: Colors.grey,
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
                  color: Colors.black.withOpacity(0.7),
                  fontSize: 15
                ),),
              ),
            ],
          ),
          Container(
            child: Text(widget.ticket.compagnieTransport, style: TextStyle(
              color: Colors.teal.withOpacity(0.7),
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),),
          ),
        ],
      ),
    );


    return Container(
      padding: EdgeInsets.only(bottom: 10),
      height: MediaQuery.of(context).size.height/5,
      width: MediaQuery.of(context).size.width,
      child: Card(
        elevation: 5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            infosTravel,
            infosOperator,
            SizedBox(height: 1)
          ],
        ),
      ),
    );
  }
}
