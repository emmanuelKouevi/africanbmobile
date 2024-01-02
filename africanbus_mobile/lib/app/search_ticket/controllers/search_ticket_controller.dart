import 'dart:math';

import 'package:africanbus_mobile/app/data/models/reservationBillet.dart';
import 'package:africanbus_mobile/app/data/models/reservation_ticket_model.dart';
import 'package:africanbus_mobile/app/data/models/ticket.dart';
import 'package:get/get.dart';

import '../../data/services/launcher_browser_service.dart';
import '../../data/services/paymetrust_service.dart';

class SearchTicketController extends GetxController{
  RxList<Billet> ticketsSelectedList = <Billet>[].obs;


  RxList<ReservationBillet> reservationTicketModelList = <ReservationBillet>[].obs;
  RxList<ReservationBillet> booksForPersonList = <ReservationBillet>[].obs;
  // ADD A TRAVELLER IN LIST OF TRAVELLERS
  void selectTicket(Billet billet) {
    if (ticketsSelectedList != null) {
      ticketsSelectedList.add(billet);
    }
  }

  void toBookPerson(ReservationBillet reservationBillet){
    if (booksForPersonList != null) {
      booksForPersonList.add(reservationBillet);
      update();
    }
  }

  void toBook(ReservationBillet reservationBillet){
    if (reservationTicketModelList != null) {
      reservationTicketModelList.add(reservationBillet);
      update();
    }
  }

  /*void addReservation(ReservationBillet reservationBillet) {
    if (reservationTicketModelList != null) {
      reservationTicketModelList.add(reservationBillet);
      update();
    }
  }*/

  void removeBookForPerson(ReservationBillet reservationBillet){
    if (booksForPersonList != null) {
      booksForPersonList.remove(reservationBillet);
      update();
    }
  }

  void removeBook(ReservationBillet reservationBillet) {
    if (reservationTicketModelList != null) {
      reservationTicketModelList.remove(reservationBillet);
      update();
    }
  }

  bool isModeProcessPayment = false;
  final _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  final Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  RxString myAccessToken = "".obs;
  String notifyUrl = "https://busolapp.com/webhook-endpoint";
  RxBool waitingMode = false.obs ;


  checkingToken() async{
    isModeProcessPayment = true ;
    final gettingToken = await PayMeTrustService().getTokenForPayment();
    // ignore: unnecessary_null_comparison
    if(gettingToken != null){
      if(gettingToken.status == "OK"){
        myAccessToken.value = gettingToken.accessToken ;
        initializedPayment(getRandomString(10), 25500, "mohamed@gmail.com", "momo", "francis",
            "0757338730", "Paiement de Token");
      }
    }else{
      Get.snackbar("Erreur", "Echec d'authentification");
    }
  }

  // INITIALIZED PAYMENT WITH PAYMETRUST
  initializedPayment(String merchantTransaction , int amount , String emailUser ,
      String nameUser , String surnameUser , String phoneNumber , String descriptionTransaction) async {
    final checkInitialize = await PayMeTrustService().initializePayment(myAccessToken.value , merchantTransaction, amount, emailUser, nameUser, surnameUser, phoneNumber, descriptionTransaction);
    if(checkInitialize.status == "OK"){
      Uri url = Uri.parse(checkInitialize.paymentUrl);
      await LauncherBrowserService().launchInBrowser(url);
    }
    checkPaymentStatus(checkInitialize.paymentToken);
  }

  // CHECKING STATUS OF PAYMENT
  checkPaymentStatus(String paymentToken) async{
    /*do{
      final checkingStatusPayment = await PayMeTrustService().checkPaymentStatus(myAccessToken.value, paymentToken);
      if(checkingStatusPayment.status == "SUCCESS"){
        //
      }else if(checkingStatusPayment.status == "FAILED"){
        waitingMode.value = false ;
      }else{
        waitingMode.value = true;
      }
    }while(waitingMode.value == true);*/
  }



}