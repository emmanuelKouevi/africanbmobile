import 'package:africanbus_mobile/app/login/controllers/auth_controller.dart';
import 'package:get/get.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
  }
}