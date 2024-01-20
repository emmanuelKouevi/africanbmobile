import 'package:africanbus_mobile/app/search_ticket/views/ticket_item.dart';
import 'package:flutter/material.dart';

import '../../../app/data/models/ticket.dart';

class TicketListView extends StatelessWidget {
  final List<Billet> ticketList ;
  const TicketListView({Key? key , required this.ticketList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(top: 30 , left: 15 , right: 15),
      itemCount: ticketList.length,
      itemBuilder: (context , index) => Padding(
        padding: EdgeInsets.only(bottom: 20),
        child: TicketItem(ticket: ticketList[index]),
      ),
    );
  }
}