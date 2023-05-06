import 'package:africanbus_mobile/dialogService/dialogService.dart';
import 'package:africanbus_mobile/models/passagerType.dart';
import 'package:africanbus_mobile/service_web/service_web.dart';
import 'package:flutter/material.dart';

class PassagersSection extends StatefulWidget {
  const PassagersSection({Key? key}) : super(key: key);

  @override
  State<PassagersSection> createState() => _PassagersSectionState();
}

class _PassagersSectionState extends State<PassagersSection> {

  List<PassagersType> passagersTypeList = [];

  initializeTypePassagers() async{
    passagersTypeList = await ServiceWebApi().getTypePassagers();
  }

  @override
  void initState(){
    super.initState();
    initializeTypePassagers();
  }

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
