import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFieldIcon extends StatelessWidget {
  const CustomTextFieldIcon({Key?key,
    required this.label,
    required this.icon,
    required this.onTap,
    required this.controller,
  }): super(key: key);

  final String label ;
  final Widget icon;
  final TextEditingController controller;
  final VoidCallback onTap ;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height/25,
        width: MediaQuery.of(context).size.width/1.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(22.0)),
        ),
        child: TextField(
          controller: controller,
          style: GoogleFonts.ubuntu(
            fontWeight: FontWeight.w600
          ),
          onTap: onTap,
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
            prefixIcon: icon
          ),
        )
    );
  }
}
