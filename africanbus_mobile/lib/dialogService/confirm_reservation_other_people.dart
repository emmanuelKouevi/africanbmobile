import 'package:africanbus_mobile/app/data/models/customer.dart';
import 'package:africanbus_mobile/app/reservations/views/reservation_ticket_list_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../app/data/models/reservationBillet.dart';
import '../app/data/models/ticket.dart';
import '../app/search_ticket/controllers/search_ticket_controller.dart';

class ConfirmReservation extends StatefulWidget {
  final Customer customer ;
  final Billet billet;
  const ConfirmReservation({Key? key , required this.customer , required this.billet}): super(key: key);

  @override
  State<ConfirmReservation> createState() => _ConfirmReservationState();
}

class _ConfirmReservationState extends State<ConfirmReservation> {
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
                text: "pour Mr/Mme ",
                style: GoogleFonts.ubuntu(
                    fontSize: 17,
                    color: Colors.black,
                ),
            ),
            TextSpan(
              text: "${widget.customer.firstname} " "${widget.customer.lastname}.",
              style: GoogleFonts.ubuntu(
                  fontSize: 17,
                  color: Colors.black,
                  fontWeight: FontWeight.bold
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
              id: 3, designation: "Ma reservation", description: "Ma reservation",
              billet: widget.billet, isForOtherPerson: true,
              customer: widget.customer
            );
            reservationController.toBookPerson(reservationBillet);
            Get.snackbar("Reservation Reussie", "Votre programme a été enregistré avec succes" , backgroundColor: Colors.green , colorText: Colors.white);
            Get.to(ReservationListTab());
          },
        ),
      ],
    );
  }
}
