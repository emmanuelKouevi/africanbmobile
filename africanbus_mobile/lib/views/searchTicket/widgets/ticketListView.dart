import 'package:africanbus_mobile/views/searchTicket/widgets/ticketItem.dart';
import 'package:flutter/material.dart';

import '../../../app/models/ticket.dart';

class TicketListView extends StatelessWidget {
  final List<Billet> ticketList ;
  const TicketListView({Key? key , required this.ticketList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(top: 10),
      itemCount: ticketList.length,
      itemBuilder: (context , index) => TicketItem(ticket: ticketList[index]),
    );
  }
}
