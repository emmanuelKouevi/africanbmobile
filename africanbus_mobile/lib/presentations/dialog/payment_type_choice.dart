import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentChoice extends GetView{
  const PaymentChoice ({ Key? key }): super(key: key);

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 20),
        child: Column(
          children: [
            ListTile(
              leading: Text("Par Mobile Money" , style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),),
              trailing: IconButton(
                onPressed: () => null,
                icon: Icon(Icons.arrow_forward_ios_rounded),
              ),
            ),
            ListTile(
              leading: Text("Autres Moyens de paiement", style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),),
              trailing: IconButton(
                onPressed: () => null,
                icon: Icon(Icons.arrow_forward_ios_rounded),
              ),
            )
          ],
        ),
      ),
    );
  }
}