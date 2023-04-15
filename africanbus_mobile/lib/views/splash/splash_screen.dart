import 'dart:async';
import 'package:africanbus_mobile/router/router.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // Define time of visibility app
  startTimer() async{
    var _duration = Duration(seconds: 6);
    return Timer(_duration, navigationPage);
  }

  // callback function for Startimer() method. Navigation after splash screen
  void navigationPage(){
    bool viewTabsPage = true;
    String showToTabs= tabsViewRoute ;
    if(viewTabsPage){
      showToTabs= tabsViewRoute;
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
              child: Text(
                'AFRICANBUS',
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.teal,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
