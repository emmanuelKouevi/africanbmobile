import 'package:africanbus_mobile/app/data/models/ticket.dart';
import 'package:africanbus_mobile/views/searchTicket/widgets/ticketDetailItem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class TicketView extends StatelessWidget {
  const TicketView({Key?key, required this.billet}):super(key: key);
  final Billet billet;
  @override
  Widget build(BuildContext context) {
    
    final title = Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
            onPressed: () => Get.back(),
            icon: Icon(Icons.arrow_back , size: 30,)
        ),
        Text("Détail du billet",style: GoogleFonts.ubuntu(
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),),
      ],
    );
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 60),
        child: Column(
          children: [
            title,
            SizedBox(height: 20,),
            TicketDetailItem(billet: billet),
          ],
        ),
      ),

    );
  }
}
