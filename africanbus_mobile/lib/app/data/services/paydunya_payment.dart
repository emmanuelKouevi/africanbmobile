import 'package:flutter/material.dart';
import 'package:paydunya/paydunya.dart';

class PaydunyaPayment{

  void payment() async {
    String masterKey = "iYSYah2u-o3J1-4BDh-h0FJ-s3esvlGl6X43";
    String privateKey = "test_private_Y9GkbnlGZmfeDibAL43GceLXMgF";
    String token = "ncljx0bAuO1FR3l17D5g";

    // Les clés d'APIs et d'environnements
    final keysApi = KeysApi(
      mode: Environment.test,
      masterKey: masterKey,
      privateKey: privateKey,
      token: token,
    );

    final paydunya = Paydunya(keysApi: keysApi);

    // Créez la facturation
    const store = Store(name: 'Your Store Name');
    const invoice = Invoice(totalAmount:  200);

    const billing = Billing(
      store: store,
      invoice: invoice,
    );

    final checkoutInvoice = await paydunya.createChekoutInvoice(billing: billing);

    debugPrint("Token: ${checkoutInvoice.token}");

    // Fournissez les informations de paiement
    final payerInfo = PayerInfo(
        fullName: "Kouevi Emmanuel Herve", email:"emmanuelhervekouevi@gmail.com",
        phone: "+2250789728501", otp: 000000,
        paymentToken: checkoutInvoice.token
    );


    // Effectuez le paiement avec une méthode de paiement
    final response = await paydunya.pay(
      payerInfo: payerInfo,
      paymentMethod: PaymentMethod.waveSenegal
    );

    // Affichez l'URL de paiement de Wave
    debugPrint("Wave URL: ${response.url}");

    // Vérifiez le statut du paiement
    final statusPaiement = await paydunya.verifyStatePayment(
      invoiceToken: checkoutInvoice.token,
    );

    // Affichez le statut du paiement
    debugPrint("Status: ${statusPaiement.status}");
    /*try {
      // les clés d'acces API et  d'environnement
      final keysApi = KeysApi(
        mode: Environment.test,
        masterKey: "QXeVLEG5-tSBV-HdZn-UN1R-LF7SsrI7Wiob",
        privateKey: "test_private_Zwo1cbfXGP1SelkZ0JFuvQ3ByVm",
        token: "hyEXXyOeFan9QDJnvgxn",
      );

      final paydunya = Paydunya(keysApi: keysApi);

      // la facturation
      const store = Store(name: 'Royal Event');
      const invoice = Invoice(totalAmount: 200);

      const billing = Billing(
        store: store,
        invoice: invoice,
      );

      final checkoutInvoice = await paydunya.createChekoutInvoice(billing: billing);

      debugPrint("Token: ${checkoutInvoice.token}");

      // Renseigner les informations du Paiement
      final payerInfo = PayerInfo(
        fullName: 'Kouevi Emmanuel Herve',
        phone: '+2250789728501',
        otp: 000000,
        paymentToken: checkoutInvoice.token,
      );
      print("Juste apres la methode payer Info");
      // Effectuer le paiement avec une méthode de paiement
      final response = await paydunya.pay(
        paymentMethod: PaymentMethod.orangeMoneySenegal,
        payerInfo: payerInfo
      );

      print("la reponse vaut ========= $response");

      // Afficher l'url de paiement de wave
      debugPrint("wave url: ${response.url}");

      // Vérifier le status du paiement
      final statusPaiement = await paydunya.verifyStatePayment(
        invoiceToken: checkoutInvoice.token,
      );

      // Afficher le status du paiement\
      debugPrint("Status: ${statusPaiement.status}");
    } catch (e) {
      debugPrint(e.toString());
    }*/
  }

}