import 'package:africanbus_mobile/services/service_web.dart';
import 'package:africanbus_mobile/views/searchTicket/widgets/ticketListView.dart';
import 'package:flutter/material.dart';
import '../../app/data/models/ticket.dart';


class TicketDateReservation extends StatefulWidget {
  const TicketDateReservation({Key? key}) : super(key: key);

  @override
  State<TicketDateReservation> createState() => _TicketDateReservationState();
}

class _TicketDateReservationState extends State<TicketDateReservation> {

  List<Billet>billets = [];

  void initializeTickets() async{
    billets = await ServiceWebApi().getOffersTravels();
  }

  @override
  void initState(){
    initializeTickets();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return billets.isNotEmpty ? TicketListView(ticketList: billets) : Center(
      child: CircularProgressIndicator( color: Colors.teal.shade900),
    )  ;
  }
}
