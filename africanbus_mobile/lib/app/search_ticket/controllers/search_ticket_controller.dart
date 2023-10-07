import 'package:africanbus_mobile/app/data/models/ticket.dart';
import 'package:get/get.dart';

class SearchTicketController extends GetxController{
  RxList<Billet> ticketsSelectedList = <Billet>[].obs;

  // ADD A TRAVELLER IN LIST OF TRAVELLERS
  void selectTicket(Billet billet) {
    if (ticketsSelectedList != null) {
      ticketsSelectedList.add(billet);
    }
  }
}