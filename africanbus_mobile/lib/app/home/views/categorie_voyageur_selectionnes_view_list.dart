import 'package:africanbus_mobile/app/home/views/categorie_item_selectionne_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/models/categorieVoyageur.dart';

class CategorieVoyageurSelectionnesListView extends GetView{
  const CategorieVoyageurSelectionnesListView(this.categoriesPassagerList, {Key? key}) : super(key: key);
  final List<TypePassager>categoriesPassagerList ;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(25),
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        itemCount: categoriesPassagerList.length,
        itemBuilder: (context, index) {
          return CategorieSelectionneItem(categoriesPassagerList[index]);
        },
      ),
    );
  }
}
