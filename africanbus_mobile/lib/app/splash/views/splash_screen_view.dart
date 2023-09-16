import 'dart:async';
import 'package:africanbus_mobile/router/app_pages.dart';
import 'package:flutter/material.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  State<SplashScreenView> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreenView> {
  // Define time of visibility app
  startTimer() async{
    var _duration = Duration(seconds: 6);
    return Timer(_duration, navigationPage);
  }

  // callback function for Startimer() method. Navigation after splash screen
  void navigationPage(){
    bool viewLoginPage = true;
    String showToTabs= Routes.login;
    if(viewLoginPage){
      showToTabs = Routes.login;
    }
    Navigator.of(context).pushReplacementNamed(showToTabs);
  }

  @override
  void initState(){
    startTimer();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                height: MediaQuery.of(context).size.height/4,
                child: Image.asset(
                  'assets/logo_africanbus.jpg',
                  fit: BoxFit.cover,
                )
            ),
          ],
        ),
      ),
    );
  }
}