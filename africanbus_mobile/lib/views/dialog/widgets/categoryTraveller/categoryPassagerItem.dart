import 'package:africanbus_mobile/app/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app/data/models/categorieVoyageur.dart';

class CategoryTravellerItem extends StatefulWidget {

  final TypePassager typePassager ;
  const CategoryTravellerItem({Key? key , required this.typePassager}) : super(key: key);

  @override
  State<CategoryTravellerItem> createState() => _CategoryTravellerItemState();
}

class _CategoryTravellerItemState extends State<CategoryTravellerItem> {
  @override
  Widget build(BuildContext context) {

    final homeController = Get.put(HomeController());

    return Container(
      margin: EdgeInsets.only(top: 7 , bottom: 7),
      child: GestureDetector(
        onTap:() {
          homeController.categoriesVoyageurList.add(widget.typePassager);
          homeController.update();
        },
        child: Text(widget.typePassager.typeDesignation , style: TextStyle(
          color: Colors.black.withOpacity(0.9),
          fontSize: 17,
          fontWeight: FontWeight.w400
        ),),
      ),
    );
  }
}

