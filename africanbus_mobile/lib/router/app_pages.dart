import 'package:africanbus_mobile/app/forgot_password/views/forget_password_view.dart';
import 'package:africanbus_mobile/app/login/bindings/login_binding.dart';
import 'package:africanbus_mobile/app/login/views/login_view.dart';
import 'package:africanbus_mobile/app/register/bindings/register_binding.dart';
import 'package:africanbus_mobile/app/register/views/register_view.dart';
import 'package:africanbus_mobile/app/splash/bindings/splash_binding.dart';
import 'package:africanbus_mobile/app/splash/views/splash_screen_view.dart';
import 'package:africanbus_mobile/views/tabs/tabs.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../app/forgot_password/bindings/forget_password_binding.dart';
import '../app/home/bindings/home_binding.dart';
import '../app/home/views/home_view.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();


  static const initial = Routes.splash;

  static final routes = [
    GetPage(
      name: _Paths.splash,
      page: () => const SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.login,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.register,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.forgotPassword,
      page: () => const ForgetPasswordView(),
      binding: ForgetPasswordBinding(),
    ),
    GetPage(
      name: _Paths.home,
      page: () => const TabsPage(),
      binding: HomeBinding(),
    ),
  ];
}
