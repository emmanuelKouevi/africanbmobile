import 'dart:math';
import 'package:africanbus_mobile/app/data/models/reservationBillet.dart';
import 'package:africanbus_mobile/app/data/models/ticket.dart';
import 'package:get/get.dart';

class SearchTicketController extends GetxController{
  RxList<Billet> ticketsSelectedList = <Billet>[].obs;


  RxList<ReservationBillet> reservationTicketModelList = <ReservationBillet>[].obs;
  RxList<ReservationBillet> booksForPersonList = <ReservationBillet>[].obs;
  // ADD A TRAVELLER IN LIST OF TRAVELLERS
  void selectTicket(Billet billet) {
    ticketsSelectedList.add(billet);
    }

  void toBookPerson(ReservationBillet reservationBillet){
    booksForPersonList.add(reservationBillet);
    update();
    }

  void toBook(ReservationBillet reservationBillet){
    reservationTicketModelList.add(reservationBillet);
    update();
    }

  void removeBookForPerson(ReservationBillet reservationBillet){
    booksForPersonList.remove(reservationBillet);
    update();
    }

  void removeBook(ReservationBillet reservationBillet) {
    reservationTicketModelList.remove(reservationBillet);
    update();
    }

  bool isModeProcessPayment = false;
  final _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  final Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  RxString myAccessToken = "".obs;
  String notifyUrl = "https://busolapp.com/webhook-endpoint";
  RxBool waitingMode = false.obs ;

}