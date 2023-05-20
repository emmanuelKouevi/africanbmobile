import 'package:africanbus_mobile/models/ticket.dart';
import 'package:flutter/material.dart';

class TicketItem extends StatefulWidget {
  final Billet ticket ;
  const TicketItem({Key? key , required this.ticket}) : super(key: key);

  @override
  State<TicketItem> createState() => _TicketItemState();
}

class _TicketItemState extends State<TicketItem> {
  @override
  Widget build(BuildContext context) {

    final infoTimeDeparture = Container(
      child: Column(
        children: [
          Text(widget.ticket.heureDepart),
          Text(widget.ticket.depart)
        ],
      ),
    );

    return Container(
      width: MediaQuery.of(context).size.width,
      child: Card(
        elevation: 3,
        child: infoTimeDeparture,
      ),
    );
  }
}
