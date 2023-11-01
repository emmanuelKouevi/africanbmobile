import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomDot extends StatelessWidget {
  const CustomDot({Key? key, required this.assetTitle, required this.color}) : super(key: key);
  final String assetTitle ;
  final Color color ;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 5),
      height: MediaQuery.of(context).size.height/20,
      width: MediaQuery.of(context).size.width/20,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: Container(
          child: SvgPicture.asset(
            assetTitle ,
            color: Colors.white,
            width: MediaQuery.of(context).size.width/3,
            height: MediaQuery.of(context).size.height/3,
            fit: BoxFit.scaleDown,
          )
      ),
    );;
  }
}
