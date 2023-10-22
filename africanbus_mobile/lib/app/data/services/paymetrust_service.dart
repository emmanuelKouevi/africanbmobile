import 'package:flutter/material.dart';

import '../../../global_config/config_global_paymetrust.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

import '../models/payment_initialize_model.dart';
import '../models/payment_status_model.dart';
import '../models/token_paymetrust_model.dart';

class PayMeTrustService{

  //TO CHECK TOKEN PAYMENT FROM PAYMETRUST SERVICE
  Future<ResponseTokenPayMeTrust> getTokenForPayment() async {
    var body = { "api_key" : PayMeTrust.apiKeyDev, "api_password" : PayMeTrust.passwordKeyDev};

    final response = await http.post(Uri.parse("${PayMeTrust.urlApiDev}v1/oauth/login") , body: jsonEncode(body) , headers: PayMeTrust.headers);
    if(response.statusCode == 200){
      var token = ResponseTokenPayMeTrust.fromJson(jsonDecode(response.body));
      return token;
    }
    else{
      throw Get.snackbar("Erreur", jsonDecode(response.body)['description'] ,
          colorText: Colors.white , backgroundColor: Colors.red);
    }
  }


  //INITIALIZE PAYMENT WITH PAYMETRUST
  Future<ResponsePaymentInitialize> initializePayment(String bearerToken , String merchantTransaction , int amount , String emailUser ,
      String nameUser , String surnameUser , String phoneNumber , String descriptionTransaction) async {
    var body = {
      'currency' : 'XOF', 'merchant_transaction_id': merchantTransaction,
      'amount': amount , "success_url": "https://8cbbcb8d08d6.ngrok.io",
      "failed_url": "https://8cbbcb8d08d6.ngrok.io/cancel/", "notify_url": "https://8cbbcb8d08d6.ngrok.io/notification",
      "lang": "fr", "designation": descriptionTransaction,
      "client_first_name": surnameUser, "client_last_name": nameUser,
      "client_phone_number": phoneNumber, "client_email": emailUser
    };
    var headersWithAuthorization = {
      'content-Type' : 'application/json',
      HttpHeaders.authorizationHeader : 'Bearer $bearerToken'
    };
    final response  = await http.post(Uri.parse("${PayMeTrust.urlApiDev}v1/payment") , body:jsonEncode(body) ,headers: headersWithAuthorization );
    if(response.statusCode == 200){
      ResponsePaymentInitialize responseTokenPayMeTrust = ResponsePaymentInitialize.fromJson(jsonDecode(response.body));
      return responseTokenPayMeTrust ;
    }else{
      throw Get.snackbar("Erreur", jsonDecode(response.body)['description'] ,
          colorText: Colors.white , backgroundColor: Colors.red);
    }
  }


  // CHECK STATUS PAYMENT INITIALISATION
  Future<PaymentStatusModel> checkStatusInitializePayment(String bearerToken) async {
    var headersWithAuthorization = {
      'content-Type' : 'application/json',
      HttpHeaders.authorizationHeader : 'Bearer $bearerToken'
    };
    final response  = await http.get(Uri.parse("${PayMeTrust.urlApiDev}v1/payment") ,headers: headersWithAuthorization );
    if(response.statusCode == 200){
      PaymentStatusModel paymentStatusModel = PaymentStatusModel.fromJson(jsonDecode(response.body));
      return paymentStatusModel ;
    }else{
      throw Get.snackbar("Erreur", jsonDecode(response.body)['description'] ,
          colorText: Colors.white , backgroundColor: Colors.red);
    }
  }

}