import 'package:africanbus_mobile/models/passagerType.dart';
import 'package:africanbus_mobile/service_web/service_web.dart';
import 'package:flutter/material.dart';

class PassagersType extends StatefulWidget {
  const PassagersType({Key? key}) : super(key: key);

  @override
  State<PassagersType> createState() => _PassagersTypeState();
}

class _PassagersTypeState extends State<PassagersType> {

  List<TypePassager> passagersTypeList = [];

  initializeTypePassagers() async{
    passagersTypeList = await ServiceWebApi().fetchPassagers();
    print("le nombre de type vaut ${passagersTypeList.length}" );
  }

  @override
  void initState(){
    super.initState();
    initializeTypePassagers();
  }



  @override
  Widget build(BuildContext context) {

    //const hr = SizedBox(height: 10);

    return AlertDialog(
      title: Text('Choisissez le type de passager' , style: TextStyle(
        fontSize: 18,
      ),),
      content: SingleChildScrollView(
        child: ListBody(
          children: passagersTypeList.map((typePassager){
            return Text(typePassager.typeDesignation);
          }).toList(),
        ),
      ),
    );
  }
}
