import 'package:africanbus_mobile/views/authentification/forgetPassword.dart';
import 'package:africanbus_mobile/views/authentification/register.dart';
import 'package:africanbus_mobile/views/searchTicket/searchTicket.dart';
import 'package:africanbus_mobile/views/splash/splash_screen.dart';
import 'package:africanbus_mobile/views/tabs/login/authentification.dart';
import 'package:africanbus_mobile/views/tabs/tabs.dart';
import 'package:flutter/material.dart';

const String homeViewRoute = '/';
const String splashViewRoute = 'splash_screen';
const String tabsViewRoute = 'tabs';
const String loginViewRoute = 'login';
const String registerViewRoute = 'register';
const String forgetPasswordViewRoute = 'forget_password';
const String searchTicketViewRoute = 'search_ticket';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch(settings.name){
    case splashViewRoute:
      return MaterialPageRoute(builder: (_) => SplashScreen());

    case tabsViewRoute:
      return MaterialPageRoute(builder: (_) => TabsPage());

    case registerViewRoute:
      return MaterialPageRoute(builder: (_) => RegisterPage());

    case forgetPasswordViewRoute:
      return MaterialPageRoute(builder: (_) => ForgetPassword());

    case loginViewRoute:
      return MaterialPageRoute(builder: (_) => AuthentificationTab());

    case searchTicketViewRoute:
      return MaterialPageRoute(builder: (_) => SearchTicket());

    default:
      return MaterialPageRoute(builder: (_) => SplashScreen());
  }
}