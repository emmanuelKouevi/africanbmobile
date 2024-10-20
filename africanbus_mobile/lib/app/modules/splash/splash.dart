import 'dart:async';
import 'package:flutter/material.dart';
import 'package:africanbus_mobile/router/router.dart' as router;

class SplashView extends StatefulWidget {
  const SplashView({Key? key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  // Define time of visibility app
  startTimer() async{
    var _duration = Duration(seconds: 6);
    return Timer(_duration, navigationPage);
  }

  // callback function for Startimer() method. Navigation after splash screen
  void navigationPage(){
    bool viewLoginPage = true;
    String showToTabs= router.loginViewRoute;
    if(viewLoginPage){
      showToTabs = router.loginViewRoute;
    }
    Navigator.pushReplacementNamed(context, showToTabs);
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
                child: Image.asset('assets/UB.jpg',
                  fit: BoxFit.cover,
                )
            ),
          ],
        ),
      ),
    );
  }
}
