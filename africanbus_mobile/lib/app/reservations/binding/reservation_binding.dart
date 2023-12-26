import 'package:get/get.dart';

class ReservationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReservationBinding(), fenix: false);
  }
}