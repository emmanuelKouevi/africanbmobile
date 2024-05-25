import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key});

  @override
  Widget build(BuildContext context) {

    const hr = SizedBox(height: 20);
    const spacer = SizedBox(height: 10);

    final header = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Qui sommes-nous ?" , style: GoogleFonts.acme(fontWeight: FontWeight.bold , color: Colors.blueGrey, fontSize: 25),),
      ],
    );

    final paragrapheOne = Text(
        """Urban Bus Ticket’s est une entreprise spécialisée dans la vente de billets d'autocar en ligne, offrant un moyen pratique et efficace de réserver des voyages en autocar à travers la Côte d’Ivoire."""
    );

    final paragrapheTwo = Text(
        """Notre mission est de simplifier le processus de réservation de voyage en autocar en offrant aux utilisateurs une expérience transparente, sécurisée et conviviale. Nous croyons fermement que voyager en autocar devrait être aussi simple que quelques clics sur un écran, et c'est précisément ce que nous nous efforçons d'offrir à nos clients."""
    );

    final paragrapheThree = Text(
      """Sur notre plateforme, les voyageurs peuvent parcourir une large sélection d'itinéraires proposés par différents transporteurs, comparer les horaires, les tarifs et les options de siège, puis réserver leur billet en quelques étapes simples. Que ce soit pour un voyage d'affaires, des vacances en famille ou une escapade entre amis, nous sommes là pour rendre le processus de réservation aussi fluide que possible."""
    );

    final paragrapheFour = Text(
      """Nous travaillons en étroite collaboration avec un réseau de partenaires de transport de confiance pour offrir à nos clients un accès à une variété d'options de voyage, garantissant ainsi une flexibilité maximale et une expérience de voyage agréable."""
    );

    final paragrapheFive = Text(
      """Chez Urban Bus Ticket’s, nous nous engageons à fournir un service clientèle exceptionnel, répondant aux questions et aux préoccupations de nos clients avec rapidité et efficacité. Nous sommes là pour accompagner nos clients à chaque étape de leur voyage, de la réservation initiale à l'arrivée à destination."""
    );

    final paragrapheSix = Text(
      """Nous sommes fiers de jouer un rôle dans la facilitation des voyages en autocar, en offrant aux voyageurs une alternative pratique et abordable aux autres modes de transport. Chez Urban Bus Ticket’s, nous sommes déterminés à rendre chaque voyage aussi agréable que possible, en offrant la commodité, la fiabilité et le service de qualité que nos clients méritent."""
    );

    final paragrapheSeven = Text(
      """Merci de nous faire confiance pour vos besoins de voyage en autocar. Nous sommes impatients de vous accueillir à bord !"""
    );

    final body = SingleChildScrollView(
      padding: EdgeInsets.only(right: 15 , left: 15),
      child: Column(
        children: [
          header,
          hr,
          paragrapheOne,
          spacer,
          paragrapheTwo,
          spacer,
          paragrapheThree,
          spacer,
          paragrapheFour,
          spacer,
          paragrapheFive,
          spacer,
          paragrapheSix,
          spacer,
          paragrapheSeven

        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("À propos" , style: GoogleFonts.acme(
            color: Colors.black
        ),),
      ),
      body: body,
    );
  }
}
