import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class CheckOptMail extends GetView{
  const CheckOptMail({Key? key}) : super(key: key);

  @override
  Widget build (BuildContext context){

    final hr = SizedBox(height: 20);
    final title1 = Text("Vérification du code",
        style: TextStyle(
          color: Colors.blueGrey,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
    );
    final title2 = Text("Entrer le code envoyé à votre numero",
      style: TextStyle(
        color: Colors.grey,
        fontSize: 16,
        fontWeight: FontWeight.w500
      ),
    );
    final yourNumber = Text("+225 0789728501", style: TextStyle(
      color: Colors.black,
      fontSize: 17
    ),);
    final title3 = Text("Vous n'avez pas reçu le code ?", textAlign: TextAlign.center);
    final resendCodeBtn = TextButton(
        onPressed: null,
        child: Text("Renvoyer le code .", style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 15
        ),)
    );

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 70),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            title1,
            hr,
            title2,
            hr,
            yourNumber,
            SizedBox(height: 50,),
            Pinput(
              autofocus: true,
              keyboardType: TextInputType.number,
              length: 4,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Entrer le code';
                }
                return null;
              },
              defaultPinTheme: const PinTheme(
                textStyle: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 1.5,
                      color: Colors.black,
                    ),
                  ),
                ),
                height: 55,
                width: 45,
              ),
              onCompleted: (value) {},
            ),
            SizedBox(height:60,),
            title3,
            resendCodeBtn,

          ],
        ),
      ),
    );
  }

}