import 'package:africanbus_mobile/app/forgot_password/controllers/forget_password_controller.dart';
import 'package:africanbus_mobile/app/login/controllers/login_controller.dart';
import 'package:get/get.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}