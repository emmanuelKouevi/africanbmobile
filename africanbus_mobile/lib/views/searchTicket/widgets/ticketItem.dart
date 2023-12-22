import 'package:africanbus_mobile/custom_widgets/custom_dot.dart';
import 'package:africanbus_mobile/views/dialog/widgets/ticketView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_any_logo/flutter_logo.dart';
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
        Container(
          child: AnyLogo.coding.swiftUI.image(
            height: 25
          ),
        ),
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

    final nombrePlaceRestant = Row(
      children: [
        Text("Place(s) restante(s) :", style: GoogleFonts.ubuntu(
            fontWeight: FontWeight.bold,
            color: Color(0xff2f3640),
            fontSize: 18
        ),),
        SizedBox(width: 5,),
        Text(widget.ticket.nombrePlaceRestant.toString(), style: GoogleFonts.ubuntu(
            fontWeight: FontWeight.bold,
            color: Color(0xff2f3640),
            fontSize: 18
        ),),
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

      ],
    );

    final moreDetail = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
            onPressed: () {
              Get.to(TicketView(billet: widget.ticket,));
            },
            child: Text("Voir détail", style: TextStyle(
              color: Colors.black,
              fontSize: 19,
              fontWeight: FontWeight.bold
            ),),
        ),
        Icon(Icons.arrow_drop_down_sharp , color: Colors.blueGrey, size: 25,)
      ],
    );

    return Card(
      child: Container(
        padding: EdgeInsets.only(left: 20 , right: 20, bottom: 20),
        height: MediaQuery.of(context).size.height/3.0,
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
            nombrePlaceRestant,
            price,
            moreDetail
          ],
        ),
      ),
    );
  }
}
