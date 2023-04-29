import 'package:africanbus_mobile/dialogService/dialogService.dart';
import 'package:flutter/material.dart';

class PassagersSection extends StatefulWidget {
  const PassagersSection({Key? key}) : super(key: key);

  @override
  State<PassagersSection> createState() => _PassagersSectionState();
}

class _PassagersSectionState extends State<PassagersSection> {
  @override
  Widget build(BuildContext context) {

    final addPassagersBtn = Container(
      width: MediaQuery.of(context).size.width/1.3,
      child: ElevatedButton.icon(
          onPressed: () => DialogService().showSelectTypePassagersDialog(context),
          icon: Icon(Icons.add , color: Colors.teal),
          label: Text('Ajouter un passager' , style: TextStyle(
            color: Colors.teal
          ),),
        style: ElevatedButton.styleFrom(
          primary: Colors.white
        ),
      ),
    );

    return Container(
      child: addPassagersBtn,
    );
  }
}
