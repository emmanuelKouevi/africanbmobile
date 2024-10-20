import 'package:africanbus_mobile/app/home/views/home_view.dart';
import 'package:africanbus_mobile/app/modules/auth/views/register.dart';
import 'package:africanbus_mobile/app/modules/splash/splash.dart';
import 'package:africanbus_mobile/app/modules/waiting/loading_page.dart';
import 'package:africanbus_mobile/application/modules/auth/login_view.dart';
import 'package:flutter/material.dart';

const String homeViewRoute = '/';
const String loginViewRoute = 'login_view';
const String registerViewRoute = 'register_view';
const String splashViewRoute = 'splash_view';
const String loadingPageViewRoute = 'loading_page_view';
const String tabsViewRoute = 'tabs';


Route<dynamic> generateRoute(RouteSettings settings) {

  switch (settings.name) {

    case loginViewRoute:
      return MaterialPageRoute(builder: (_) => const LoginView());
      // ignore: dead_code
      break;

    case registerViewRoute:
      return MaterialPageRoute(builder: (_) => const RegisterView());
      // ignore: dead_code
      break;

    case splashViewRoute:
      return MaterialPageRoute(builder: (_) => const SplashView());
      // ignore: dead_code
      break;

    case loadingPageViewRoute:
      return MaterialPageRoute(builder: (_) => const LoadingPage());
      // ignore: dead_code
      break;

    default:
      return MaterialPageRoute(builder: (_) => const HomeView());
  }
}