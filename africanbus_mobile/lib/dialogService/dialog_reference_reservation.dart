import 'package:africanbus_mobile/app/data/models/customer.dart';
import 'package:africanbus_mobile/app/data/models/reservationBillet.dart';
import 'package:africanbus_mobile/app/data/models/ticket.dart';
import 'package:africanbus_mobile/app/search_ticket/controllers/search_ticket_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../app/reservations/views/reservation_ticket_list_view.dart';

class SelfReservationDialog extends StatefulWidget {
  final Billet billet;
  const SelfReservationDialog({Key? key , required this.billet}):super(key: key);

  @override
  State<SelfReservationDialog> createState() => _SelfReservationDialogState();
}

class _SelfReservationDialogState extends State<SelfReservationDialog> {

  @override
  Widget build(BuildContext context) {

    final reservationController = Get.put(SearchTicketController());

    return AlertDialog(
      title: Text('Confirmation'.toUpperCase(),style: GoogleFonts.ubuntu(
          fontSize: 20,
          color: Colors.black,
          fontWeight: FontWeight.bold
      ),),
      content: RichText(
        text: TextSpan(
            children: [
              TextSpan(
                  text: "Vous êtes sur de vouloir réserver le billet ",
                  style: GoogleFonts.ubuntu(
                      fontSize: 17,
                      color: Colors.black
                  )
              ),
              TextSpan(
                  text: "${widget.billet.depart} - ${widget.billet.destination} ",
                  style: GoogleFonts.ubuntu(
                      fontSize: 17,
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                  )
              ),
              TextSpan(
                text: "pour Vous même. ",
                style: GoogleFonts.ubuntu(
                  fontSize: 17,
                  color: Colors.black,
                ),
              ),
            ]
        ),
      ),
      actions: [
        TextButton(
          child: const Text("Retour" , style: TextStyle(
              color: Color(0xff2c3e50)
          ),),
          onPressed: () {
            Get.back();
          },
        ),
        TextButton(
          child: const Text("Confirmer" , style: TextStyle(
            color: Color(0xff2c3e50),
          ),),
          onPressed: () {
            ReservationBillet reservationBillet = ReservationBillet(
                id: 1, designation: "Ma reservation", description: "Ma reservation",
                billet: widget.billet, isForOtherPerson: false,
                customer: Customer(id: '8' , firstname: "Null" , lastname: "Null" , phoneNumber: "Null")
            );
            reservationController.toBook(reservationBillet);
            Get.snackbar("Reservation Reussie", "Votre programme a été enregistré avec succes" , backgroundColor: Colors.green , colorText: Colors.white);
            Get.offAll(ReservationListTab());
          },
        ),
      ],
    );
  }
}
