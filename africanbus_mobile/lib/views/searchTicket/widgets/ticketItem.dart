import 'package:africanbus_mobile/app/search_ticket/controllers/search_ticket_controller.dart';
import 'package:africanbus_mobile/app/search_ticket/views/ticket_detail_view.dart';
import 'package:africanbus_mobile/custom_widgets/custom_dot.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
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

    final trajet = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(widget.ticket.depart , style: GoogleFonts.rubik(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.teal.shade900
        ),),
        Text(widget.ticket.destination , style: GoogleFonts.rubik(
            fontWeight: FontWeight.bold,
            color: Colors.teal.shade900,
            fontSize: 20
        ),),
      ],
    );

    final libelle = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text('Départ' , style: GoogleFonts.ubuntu(
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),),
            SizedBox(height: 5,),
            Text(widget.ticket.heureDepart , style: GoogleFonts.rubik(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.black
            ),),
          ],
        ),

        Column(
          children: [
            Text('Reference' , style: GoogleFonts.ubuntu(
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),),
            SizedBox(height: 5,),
            Text(widget.ticket.id, style: GoogleFonts.rubik(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 17
            ),),
          ],
        ),
      ],
    );

    final dot = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomDot(assetTitle: "assets/svg_icons/dot.svg", color: Colors.blueGrey),
        Text('----------------------------------------------------------' , style: TextStyle(
          color: Colors.grey.withOpacity(0.5)
        ),),
        CustomDot(assetTitle: "assets/svg_icons/dot.svg", color: Colors.teal.shade900)
      ],
    );

    final price = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(widget.ticket.coutReservation.toString() + ' ' + 'FCFA', style: GoogleFonts.ubuntu(
          fontWeight: FontWeight.bold,
          color: Color(0xff192a56),
          fontSize: 20
        ),),
        TextButton(
            onPressed: null,
            child: Text("Réserver ce billet".toUpperCase() , style: GoogleFonts.ubuntu(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Color(0xff2f3640)
            ),)
        ),
      ],
    );

    return Card(
      child: Container(
        padding: EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height/3.5,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(30))
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            trajet,
            SizedBox(height: 15),
            libelle,
            dot,
            price
          ],
        ),
      ),
    );
  }
}
