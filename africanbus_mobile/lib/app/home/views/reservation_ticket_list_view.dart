import 'package:africanbus_mobile/app/search_ticket/controllers/search_ticket_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ReservationListTab extends StatefulWidget {
  const ReservationListTab({Key?key}):super(key: key);

  @override
  State<ReservationListTab> createState() => _ReservationListTabState();
}

class _ReservationListTabState extends State<ReservationListTab> {
  @override
  Widget build(BuildContext context) {

    final reservationController = Get.put(SearchTicketController());

    final noReservation = LottieBuilder.asset("assets/lottie/not_ticket.json");
    
    final label = Text("Vous n'avez pas de ticket en réservation", style: TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.w500,
      fontSize: 20
    ),);
    
    final findTicketBtn = Container(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.teal.shade900
        ),
        onPressed: () => null,
        child: Text('Trouver une offre', style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20
        ),),
      ),
    );
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Obx(() => reservationController.reservationTicketModelList.isEmpty
              ? noReservation : CircularProgressIndicator()),
            ),
            label,
            SizedBox(height: 25,),
            findTicketBtn
          ],
        ),
      ),
    );
  }
}
