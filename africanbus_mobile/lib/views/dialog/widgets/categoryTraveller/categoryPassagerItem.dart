import 'package:africanbus_mobile/views/dialog/viewModel/traveller/categoryPassagerViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/models/categorieVoyageur.dart';

class CategoryTravellerItem extends StatefulWidget {

  final TypePassager typePassager ;
  const CategoryTravellerItem({Key? key , required this.typePassager}) : super(key: key);

  @override
  State<CategoryTravellerItem> createState() => _CategoryTravellerItemState();
}

class _CategoryTravellerItemState extends State<CategoryTravellerItem> {
  @override
  Widget build(BuildContext context) {

    var actionCategoryTraveller = Provider.of<CategoryPassagerViewModel>(context);

    return Container(
      margin: EdgeInsets.only(top: 7 , bottom: 7),
      child: GestureDetector(
        onTap: () => actionCategoryTraveller.addCategoryVoyageur(widget.typePassager),
        child: Text(widget.typePassager.typeDesignation , style: TextStyle(
          color: Colors.black.withOpacity(0.9),
          fontSize: 17,
          fontWeight: FontWeight.w400
        ),),
      ),
    );
  }
}

