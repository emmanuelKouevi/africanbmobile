import 'package:africanbus_mobile/views/dialog/viewModel/traveller/categoryPassagerViewModel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../../../app/models/categorieVoyageur.dart';

class SelectedCategoryItem extends StatefulWidget {
  final TypePassager typePassager ;
  const SelectedCategoryItem({Key? key , required this.typePassager}) : super(key: key);

  @override
  State<SelectedCategoryItem> createState() => _SelectedCategoryItemState();
}

class _SelectedCategoryItemState extends State<SelectedCategoryItem> {
  @override
  Widget build(BuildContext context) {

    var providerCategoryTraveller = Provider.of<CategoryPassagerViewModel>(context);

    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Card(
        elevation: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.3),
              ),
              child: ListTile(
                title: Text(widget.typePassager.typeDesignation , style: TextStyle(
                  fontWeight: FontWeight.bold
                ),),
                trailing: IconButton(
                  icon: FaIcon(FontAwesomeIcons.xmark),
                  onPressed: () => providerCategoryTraveller.removeCategoryVoyageur(widget.typePassager)
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15 , left: 5),
              height: MediaQuery.of(context).size.height/25,
              child: Text('Cartes et codes de réduction', textAlign: TextAlign.center,),
            ),
          ],
        ),
      ),
    );
  }
}
