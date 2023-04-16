import 'package:africanbus_mobile/views/authentification/inscription.dart';
import 'package:africanbus_mobile/views/splash/splash_screen.dart';
import 'package:africanbus_mobile/views/tabs/tabs.dart';
import 'package:flutter/material.dart';

const String homeViewRoute = '/';
const String splashViewRoute = 'splash_screen';
const String tabsViewRoute = 'tabs';
const String registerViewRoute = 'register';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch(settings.name){
    case splashViewRoute:
      return MaterialPageRoute(builder: (_) => SplashScreen());

    case tabsViewRoute:
      return MaterialPageRoute(builder: (_) => TabsPage());

    case registerViewRoute:
      return MaterialPageRoute(builder: (_) => RegisterPage());

    default:
      return MaterialPageRoute(builder: (_) => SplashScreen());
  }
}