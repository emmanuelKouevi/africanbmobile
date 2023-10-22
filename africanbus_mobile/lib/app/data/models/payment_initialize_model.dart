class ResponsePaymentInitialize{
  final int code ;
  final String status ;
  final String paymentToken ;
  final String notifyToken ;
  final String transactionId ;
  final String merchantTransactionId;
  final String paymentUrl;

  ResponsePaymentInitialize({
    required this.code , required this.status , required this.paymentToken, required this.notifyToken,
    required this.transactionId , required this.merchantTransactionId , required this.paymentUrl
  });

  factory ResponsePaymentInitialize.fromJson(Map<String, dynamic> json) {
    return ResponsePaymentInitialize(
      code: json['code'],
      status: json['status'],
      paymentToken: json['payment_token'],
      notifyToken: json['notify_token'],
      transactionId: json['transaction_id'],
      merchantTransactionId: json['merchant_transaction_id'],
      paymentUrl: json['payment_url'],
    );
  }

  ResponsePaymentInitialize.fromMap(Map map)
      :code = map['code'],
        status = map['status'],
        paymentToken = map['payment_token'],
        notifyToken = map['notify_token'],
        transactionId = map['transaction_id'],
        merchantTransactionId = map['merchant_transaction_id'],
        paymentUrl = map['payment_url'];


  Map toMap(){
    return {
      'code': code ,
      'status': status ,
      'payment_token': paymentToken,
      'notify_token': notifyToken,
      'transaction_id': transactionId,
      'merchant_transaction_id' : merchantTransactionId,
      'payment_url' : paymentUrl
    };
  }

  Map toJson(){
    return{
      'code' : code,
      'status' : status,
      'payment_token': paymentToken,
      'notify_token': notifyToken,
      'transaction_id' : transactionId,
      'merchant_transaction_id' : merchantTransactionId,
      'payment_url' : paymentUrl,
    };
  }

}
