import 'package:africanbus_mobile/custom_widgets/custom_simple_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InfosPassagerSectionDialog extends GetView{
  InfosPassagerSectionDialog({ Key?key }): super(key: key);

  TextEditingController userEmail = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController userLastName = TextEditingController();

  @override
  Widget build(BuildContext context){

    final email = Container(
      child: CustomSimpleTextField(
          key: Key("userEmail"),
          labelText: "E-mail",
          enabled: true,
          onTap: () => null,
          isOutlined: true,
          controller: userEmail
      ),
    );

    final userName = Container(
      child: CustomSimpleTextField(
          key: Key("userName"),
          labelText: "Nom",
          enabled: true,
          isOutlined: true,
          onTap: () => null,
          controller: username
      ),
    );

    final userPrenoms = Container(
      child: CustomSimpleTextField(
          key: Key("userName"),
          labelText: "Prenoms",
          enabled: true,
          isOutlined: true,
          onTap: () => null,
          controller: userLastName
      ),
    );

    final otherInfos = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: MediaQuery.of(context).size.width/2.3,
            child: userName,
          ),
          Container(
            width: MediaQuery.of(context).size.width/2.3,
            child: userPrenoms,
          )
        ],
      ),
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
        title: Text("Section passagers" , style: TextStyle(
            fontWeight: FontWeight.bold
        ),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 50, left: 10, right: 10),
        child: Column(
          children: [
            email,
            SizedBox(height: 20,),
            Divider(height: 10, thickness: 2,),
            SizedBox(height: 20,),
            otherInfos,
            SizedBox(height: 20,),
            saveBtn,
          ],
        ),
      ),
    );
  }
}