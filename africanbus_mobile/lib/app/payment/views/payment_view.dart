import 'package:africanbus_mobile/app/data/models/ticket.dart';
import 'package:flutter/material.dart';
import 'package:flutter_any_logo/flutter_logo.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../custom_widgets/custom_dot.dart';

class PaymentView extends StatefulWidget {
  final Billet billet ;
  const PaymentView({Key? key, required this.billet });

  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  @override
  Widget build(BuildContext context) {
    final compagnieTransportDetail = Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          child: AnyLogo.coding.swiftUI.image(
              height: 50
          ),
        ),
        Text(widget.billet.compagnieTransport , style: GoogleFonts.ubuntu(
          fontWeight: FontWeight.bold,
          fontSize: 25,
          color: Color(0xfff2c3e50),
        ),)
      ],
    );

    final trajet = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(widget.billet.depart , style: GoogleFonts.rubik(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.teal.shade900
        ),),

        Text(widget.billet.destination , style: GoogleFonts.rubik(
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
              fontSize: 18,
              color: Colors.grey,
            ),),
            SizedBox(height: 5,),
            Text(widget.billet.heureDepart , style: GoogleFonts.rubik(
                fontSize: 18,
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
                fontSize: 18
            ),),
            SizedBox(height: 5,),
            Text(widget.billet.id, style: GoogleFonts.rubik(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 18
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
        Text(widget.billet.nombrePlaceRestant.toString(), style: GoogleFonts.ubuntu(
            fontWeight: FontWeight.bold,
            color: Color(0xff2f3640),
            fontSize: 18
        ),),
      ],
    );

    final price = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Prix du billet",  style: GoogleFonts.ubuntu(
            fontWeight: FontWeight.bold,
            color: Color(0xff192a56),
            fontSize: 18
        ),),
        Text(widget.billet.coutReservation.toString() + ' ' + 'FCFA', style: GoogleFonts.ubuntu(
            fontWeight: FontWeight.bold,
            color: Color(0xff192a56),
            fontSize: 18
        ),),
      ],
    );

    final modeOffreVoyage = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Mode de l'offre",  style: GoogleFonts.ubuntu(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 18
        ),),
        Text(widget.billet.modeOffreVoyage,  style: GoogleFonts.ubuntu(
            fontWeight: FontWeight.bold,
            color: Color(0xff192a56),
            fontSize: 18
        ),),
      ],
    );

    final categorie = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Adressé aux :",  style: GoogleFonts.ubuntu(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 18
        ),),
        Text(widget.billet.categorieOffreVoyage,  style: GoogleFonts.ubuntu(
            fontWeight: FontWeight.bold,
            color: Color(0xff192a56),
            fontSize: 18
        ),),
      ],
    );

    final features = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(Icons.wifi , size: 25 ,color:Colors.blueGrey),
        Icon(Icons.six_ft_apart , size: 25 , color: Colors.blueGrey,)
      ],
    );

    final title = Text("Paiement" , style: GoogleFonts.ubuntu(
      fontWeight: FontWeight.bold,
      fontSize: 17
    ),);

    final paymentType = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Moyens de paiements disponibles", style: GoogleFonts.ubuntu(
          fontWeight: FontWeight.w700,
          color: Colors.black.withOpacity(0.8),
        ),)
      ],
    );

    final paiementBtn = Container(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.teal.shade800
        ),
        onPressed: () => null,
        child: Text("Paiement" , style: GoogleFonts.ubuntu(
          fontWeight: FontWeight.bold,
          fontSize: 17,
          color: Colors.white
        ),),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: title,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 15 , left: 10 , right: 10),
        child: Column(
          children: [
            compagnieTransportDetail,
            SizedBox(height: 20),
            trajet,
            SizedBox(height: 10),
            libelle,
            dot,
            SizedBox(height: 10,),
            price,
            SizedBox(height: 10,),
            nombrePlaceRestant,
            SizedBox(height: 15,),
            features,
            SizedBox(height: 15,),
            modeOffreVoyage,
            SizedBox(height: 15,),
            categorie,
            SizedBox(height: 40,),
            Divider(),
            paymentType,
            SizedBox(height: 200,),
            paiementBtn
          ],
        ),
      ),
    );
  }
}
