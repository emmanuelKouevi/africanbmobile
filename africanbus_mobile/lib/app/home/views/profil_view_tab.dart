import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilView extends GetView{
  const ProfilView ({Key? key}): super(key: key);

  Widget build(BuildContext context){

    final monProfil = Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: Get.height/5,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/emmanuel_herve.jpg'),
                fit: BoxFit.cover,
              )
            ),
          ),
          SizedBox(height: 5,),
          Text('Emmanuel Herve Kouevi' , style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20
          ),)
        ],
      ),
    );

    final settings = Container(
      height: Get.height/2,
      padding: EdgeInsets.only(left: 7 , top: 7),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: const Offset(
              5.0,
              5.0,
            ),
            blurRadius: 10.0,
            spreadRadius: 2.0,
          ), //BoxShadow
          BoxShadow(
            color: Colors.white,
            offset: const Offset(0.0, 0.0),
            blurRadius: 0.0,
            spreadRadius: 0.0,
          ), //BoxShadow
        ],
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30)
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Paramètres", style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 25
          ),),
          SizedBox(height: 10,),
          ListTile(
            leading: Text("Mes reservations", style: TextStyle(
              fontSize: 18,
              fontStyle: FontStyle.normal
            ),),
            trailing: IconButton(
              onPressed: () => null,
              icon: Icon(Icons.arrow_forward_ios_rounded),
            ),
          ),
          ListTile(
            leading: Text("Mon compte", style: TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.normal
            ),),
            trailing: IconButton(
              onPressed: () => null,
              icon: Icon(Icons.arrow_forward_ios_rounded),
            ),
          ),
          ListTile(
            leading: Text("Sécurité", style: TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.normal
            ),),
            trailing: IconButton(
              onPressed: () => null,
              icon: Icon(Icons.arrow_forward_ios_rounded),
            ),
          ),
          ListTile(
            leading: Text("Aide", style: TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.normal
            ),),
            trailing: IconButton(
              onPressed: () => null,
              icon: Icon(Icons.arrow_forward_ios_rounded),
            ),
          ),
          ListTile(
            leading: Text("A propos", style: TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.normal
            ),),
            trailing: IconButton(
              onPressed: () => null,
              icon: Icon(Icons.arrow_forward_ios_rounded),
            ),
          ),
          ListTile(
            leading: Text("Se déconnecter", style: TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.normal
            ),),
            trailing: IconButton(
              onPressed: () => null,
              icon: Icon(Icons.arrow_forward_ios_rounded),
            ),
          ),
        ],
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white70,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 20),
        child: Column(
          children: [
            monProfil,
            SizedBox(height: 25,),
            settings
          ],
        ),
      ),
    );
  }
}