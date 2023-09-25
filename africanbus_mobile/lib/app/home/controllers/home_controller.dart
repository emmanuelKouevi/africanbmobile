import 'package:get/get.dart';
import '../../data/models/categorieVoyageur.dart';

class HomeController extends GetxController{

  RxList<TypePassager> categoriesVoyageurList = <TypePassager>[].obs;

  void addVoyageur(TypePassager typePassager) {
    if (categoriesVoyageurList != null) {
      categoriesVoyageurList.add(typePassager);
    }
  }

  void removeVoyageur(TypePassager typePassager) {
    if (categoriesVoyageurList != null) {
      categoriesVoyageurList.remove(typePassager);
    }
  }
}