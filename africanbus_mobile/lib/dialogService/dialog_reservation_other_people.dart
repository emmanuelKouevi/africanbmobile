import 'package:africanbus_mobile/app/data/models/ticket.dart';
import 'package:africanbus_mobile/dialogService/dialog_info_user.dart';
import 'package:africanbus_mobile/dialogService/dialog_reference_reservation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DialogReservation extends StatefulWidget {
  final Billet ticket ;
  const DialogReservation({Key? key , required this.ticket}):super(key: key);

  @override
  State<DialogReservation> createState() => _DialogReservationState();
}

class _DialogReservationState extends State<DialogReservation> {
  int selectedOption = 1;
  bool isNotForSelf = false;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Réserver pour'.toUpperCase(),style: GoogleFonts.ubuntu(
        fontSize: 15,
        color: Colors.black,
        fontWeight: FontWeight.bold
      ),),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          ListTile(
            title:Text('Moi même' , style: GoogleFonts.ubuntu(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black,
            ),),
            leading: Radio<int>(
              value: 1,
              groupValue: selectedOption,
              activeColor: Color(0xff2c3e50), // Change the active radio button color here
              fillColor: MaterialStateProperty.all(Color(0xff2c3e50)), // Change the fill color when selected
              splashRadius: 20, // Change the splash radius when clicked
              onChanged: (value) {
                setState(() {
                  selectedOption = value!;
                });
              },
            ),
          ),
          ListTile(
            title: Text('Autre personne' , style: GoogleFonts.ubuntu(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),),
            leading: Radio<int>(
              value: 2,
              groupValue: selectedOption,
              activeColor: Color(0xff2c3e50), // Change the active radio button color here
              fillColor: MaterialStateProperty.all(Color(0xff2c3e50)), // Change the fill color when selected
              splashRadius: 25, // Change the splash radius when clicked
              onChanged: (value) {
                setState(() {
                  selectedOption = value!;
                });
              },
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
            child: const Text("Annuler" , style: TextStyle(
              color: Color(0xff2c3e50)
            ),),
            onPressed: () {
              Get.back();
            },
        ),
        TextButton(
            child: const Text("Suivant" , style: TextStyle(
              color: Color(0xff2c3e50),
            ),),
            onPressed: () {
              if(selectedOption == 1){
                Get.dialog(SelfReservationDialog(billet: widget.ticket,));
              }else{
                Get.dialog(DialogUserInfo(billet: widget.ticket) , barrierDismissible: true);
              }
            },
        ),
      ],
    );
  }
}

