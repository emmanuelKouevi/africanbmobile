import 'package:africanbus_mobile/views/dialog/viewModel/traveller/categoryPassagerViewModel.dart';
import 'package:africanbus_mobile/views/dialog/widgets/categoryTraveller/selectedCategoryItem.dart';
import 'package:flutter/material.dart';


class SelectedCategoryTravellerList extends StatelessWidget {
  final CategoryPassagerViewModel categoryPassagerViewModel ; 
  const SelectedCategoryTravellerList({Key? key , required this.categoryPassagerViewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(25),
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        itemCount: categoryPassagerViewModel.data.length,
        itemBuilder: (context, index) {
          return SelectedCategoryItem(typePassager: categoryPassagerViewModel.data[index]);
        },
      ),
    );
  }
}
