import 'package:get/get.dart';

class ProfilBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfilBinding(), fenix: false);
  }
}