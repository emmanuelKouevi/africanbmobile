import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({Key? key}): super(key: key);

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  @override
  Widget build(BuildContext context) {

    final title = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Notification', style: GoogleFonts.ubuntu(
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),),
        IconButton(
            onPressed: null,
            icon: FaIcon(FontAwesomeIcons.trashArrowUp)
        ),
      ],
    );
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 20 , left: 10 , right: 10),
        child: Column(
          children: [
            title
          ],
        ),
      ),
    );
  }
}
