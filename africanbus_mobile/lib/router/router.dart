import 'package:africanbus_mobile/views/splash/splash_screen.dart';
import 'package:africanbus_mobile/views/tabs/tabs.dart';
import 'package:flutter/material.dart';

const String homeViewRoute = '/';
const String splashViewRoute = 'splash_screen';
const String tabsViewRoute = 'tabs';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch(settings.name){
    case splashViewRoute:
      return MaterialPageRoute(builder: (_) => SplashScreen());

    case tabsViewRoute:
      return MaterialPageRoute(builder: (_) => TabsPage());

    default:
      return MaterialPageRoute(builder: (_) => SplashScreen());
  }
}