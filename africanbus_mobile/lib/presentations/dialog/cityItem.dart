import 'package:flutter/material.dart';
import '../../app/data/models/villeModel.dart';

class CityItem extends StatefulWidget {
  final Ville ville ;
  final TextEditingController textEditingController;
  const CityItem({Key? key , required this.ville , required this.textEditingController }) : super(key: key);

  @override
  State<CityItem> createState() => _CityItemState();
}

class _CityItemState extends State<CityItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 10 , bottom: 5),
        child: GestureDetector(
          onTap: () {
            widget.textEditingController.text = widget.ville.designation ;
            Navigator.of(context).pop();
          },
          child: ListTile(
            title: Text(widget.ville.designation, style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black.withOpacity(0.7)
            ),),
            trailing: Text(widget.ville.paysDesignation , style: TextStyle(
                fontWeight: FontWeight.w800,
                color: Colors.grey.withOpacity(0.8)
            ),),
          ),
        )
    );
  }
}