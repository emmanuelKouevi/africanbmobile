import 'package:africanbus_mobile/models/ticket.dart';
import 'package:africanbus_mobile/views/searchTicket/widgets/ticketItem.dart';
import 'package:flutter/material.dart';

class TicketListView extends StatelessWidget {
  final List<Billet> ticketList ;
  const TicketListView({Key? key , required this.ticketList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        itemCount: ticketList.length,
        itemBuilder: (context , index) => TicketItem(ticket: ticketList[index]),
      ),
    );
  }
}
