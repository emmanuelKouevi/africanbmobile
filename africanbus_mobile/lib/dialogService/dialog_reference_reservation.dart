import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../custom_widgets/custom_text_form_field.dart';

class SelfReservationDialog extends StatefulWidget {
  const SelfReservationDialog({Key? key}):super(key: key);

  @override
  State<SelfReservationDialog> createState() => _SelfReservationDialogState();
}

class _SelfReservationDialogState extends State<SelfReservationDialog> {
  TextEditingController designation = TextEditingController();
  TextEditingController description = TextEditingController();
  @override
  Widget build(BuildContext context) {

    final hr = SizedBox(height: 10);

    final title = Row(
      children: [
        Text("Réferencez votre demande de reservation" , style: GoogleFonts.rubik(
          fontWeight: FontWeight.bold,
          color: Colors.black.withOpacity(0.8),
          fontSize: 15
        ),)
      ],
    );

    final referenceReservation = Container(
      child: CustomTextFormField(
        controller: designation,
        icon: Icons.edit,
        labelText: "Réference",
        isOutlined: false,
        enabled: true,
        key: Key("ReferenceReservation"),
      ),
    );

    final descriptionReservation = Container(
      child: CustomTextFormField(
        controller: description,
        icon: Icons.edit,
        labelText: "Description",
        isOutlined: false,
        enabled: true,
        isTexterea: true,
        key: Key("ReferenceDescription"),
      ),
    );

    final reserverBtn = Container(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.teal.shade800
        ),
        child: Text("Réserver".toUpperCase() , style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),),
        onPressed: () {

        },
      ),
    );


    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 50 , left: 10 , right: 10),
        child: Column(
          children: [
            title,
            hr,
            referenceReservation,
            hr,
            descriptionReservation,
            hr,
            reserverBtn,
          ],
        )
      ),
    );
  }
}
