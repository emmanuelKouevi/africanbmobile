import 'package:africanbus_mobile/models/ticket.dart';
import 'package:africanbus_mobile/service_web/service_web.dart';
import 'package:africanbus_mobile/views/searchTicket/widgets/ticketListView.dart';
import 'package:flutter/material.dart';

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
    return Container(
      height: MediaQuery.of(context).size.height,
      child: billets.isNotEmpty ? CircularProgressIndicator() : TicketListView(ticketList: billets)
    );
  }
}
