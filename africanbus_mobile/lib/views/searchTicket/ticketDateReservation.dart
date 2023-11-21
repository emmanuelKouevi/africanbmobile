import 'package:africanbus_mobile/services/service_web.dart';
import 'package:africanbus_mobile/views/searchTicket/widgets/ticketListView.dart';
import 'package:flutter/material.dart';
import '../../app/data/models/ticket.dart';


class TicketDateReservation extends StatefulWidget {
  const TicketDateReservation({Key? key}) : super(key: key);

  @override
  State<TicketDateReservation> createState() => _TicketDateReservationState();
}

class _TicketDateReservationState extends State<TicketDateReservation> {

  List<Billet>billets = [];

  List<Billet>tickets = [
    Billet(
      depart: "Abidjan" , categorieOffreVoyage: "Adulte" , id: "OFCI",
      compagnieTransport: "AFRICAN" , coutReservation: 25600 , nombrePlaceRestant: 21,
      propriete1: "Wifi" , propriete2: "Charge" , destination: "Man" , heureDepart: "11h45",
      heureArrivee: "12h45" , modeOffreVoyage: "Classique"
    ),
    Billet(
        depart: "Tiébissou" , categorieOffreVoyage: "Enfant" , id: "TUMP",
        compagnieTransport: "UTB" , coutReservation: 17560 , nombrePlaceRestant: 10,
        propriete1: "Wifi" , propriete2: "Charge" , destination: "Adiaké" , heureDepart: "04h50",
        heureArrivee: "13h" , modeOffreVoyage: "VIP"
    ),
    Billet(
        depart: "San-Pédro" , categorieOffreVoyage: "Enfant" , id: "TUM",
        compagnieTransport: "STC" , coutReservation: 75400 , nombrePlaceRestant: 5,
        propriete1: "Wifi" , propriete2: "Charge" , destination: "Yamoussokro" , heureDepart: "08h35",
        heureArrivee: "15h30" , modeOffreVoyage: "VIP"
    ),
    Billet(
        depart: "Bingerville" , categorieOffreVoyage: "Adulte" , id: "TUM",
        compagnieTransport: "OCEANIE" , coutReservation: 75400 , nombrePlaceRestant: 17,
        propriete1: "Wifi" , propriete2: "Charge" , destination: "Grand-Bassam" , heureDepart: "08h35",
        heureArrivee: "15h30" , modeOffreVoyage: "Classique"
    ),
  ];

  void initializeTickets() async{
    billets = await ServiceWebApi().getOffersTravels();
  }

  @override
  void initState(){
    initializeTickets();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return tickets.isNotEmpty ? TicketListView(ticketList: tickets) : Center(
      child: CircularProgressIndicator( color: Colors.teal.shade900),
    )  ;
  }
}
