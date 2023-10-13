import 'package:africanbus_mobile/custom_widgets/custom_simple_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReservationSectionDialog extends GetView{
  ReservationSectionDialog({ Key?key }): super(key: key);

  TextEditingController designationController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context){

    final designationReservation = CustomSimpleTextField(
        key: Key("designationReservation"),
        labelText: "Designation",
        enabled: true,
        isOutlined: true,
        onTap: () => null,
        controller: designationController
    );

    final descriptionReservation = CustomSimpleTextField(
        key: Key("descriptionReservation"),
        labelText: "Description",
        enabled: true,
        isOutlined: true,
        onTap: () => null,
        controller: descriptionController
    );
    
    final saveBtn = Container(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.teal.shade900
        ),
        onPressed: () => null,
        child: Text("SAUVEGARDER" , style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold
        ),),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Section reservation" , style: TextStyle(
          fontWeight: FontWeight.bold
        ),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 50, left: 10, right: 10),
        child: Column(
          children: [
            designationReservation,
            SizedBox(height: 20,),
            Divider(height: 10, thickness: 3.0),
            SizedBox(height: 20,),
            descriptionReservation,
            SizedBox(height: 20,),
            saveBtn,
            SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}