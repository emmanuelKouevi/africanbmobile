import 'package:africanbus_mobile/views/dialog/widgets/categoryTraveller/selectedCategoryItem.dart';
import 'package:flutter/material.dart';

import '../../../../app/data/models/categorieVoyageur.dart';


class SelectedCategoryTravellerList extends StatelessWidget {
  final List<TypePassager>categoriesPassagerList ;
  const SelectedCategoryTravellerList({Key? key, required this.categoriesPassagerList , }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(25),
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        itemCount: categoriesPassagerList.length,
        itemBuilder: (context, index) {
          return SelectedCategoryItem(typePassager: categoriesPassagerList[index]);
        },
      ),
    );
  }
}
