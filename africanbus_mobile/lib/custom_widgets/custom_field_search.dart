import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomFieldSearch extends StatelessWidget {
  const CustomFieldSearch({Key? key, required this.label, required this.icon, required this.controller, required this.onTap}) : super(key:key);
  final String label ;
  final Widget icon;
  final VoidCallback onTap ;
  final TextEditingController controller ;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height/25,
        width: MediaQuery.of(context).size.width/1.5,
        decoration: BoxDecoration(
          color: Color.fromARGB(216, 216, 216, 216),
          borderRadius: BorderRadius.all(Radius.circular(22.0)),
        ),
        child: TextField(
          style: GoogleFonts.rubik(
            fontSize: 15,
            color: Colors.black,
            fontWeight: FontWeight.bold
          ),
          onTap: onTap,
          controller: controller,
          enabled: true,
          onSubmitted: (value) {
            if (value.isNotEmpty) {
              //TODO : IMPLEMENT METHODS ALLOWING CHOICE STATION
            }
          },
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
            border: InputBorder.none,
            hintText: label,
            hintStyle: TextStyle(color: Colors.grey),
          ),
        )
    );
  }
}
