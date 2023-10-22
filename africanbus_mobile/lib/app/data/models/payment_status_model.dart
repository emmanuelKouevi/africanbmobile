import 'package:africanbus_mobile/app/data/models/user_payment_model.dart';

class PaymentStatusModel{
  final int code ;
  final String status;
  final String merchantTransactionId;
  final String transactionId ;
  final UserPayment user ;

  const PaymentStatusModel({
    required this.code , required this.status,
    required this.merchantTransactionId , required this.transactionId , required this.user
  });

  factory PaymentStatusModel.fromJson(Map<String, dynamic> json) {
    return PaymentStatusModel(
      code: json['code'],
      status: json['status'],
      merchantTransactionId: json['merchant_transaction_id'],
      transactionId: json['transaction_id'],
      user: UserPayment.fromJson(json['user']),
    );
  }

  PaymentStatusModel.fromMap(Map map)
      :code = map['code'],
        status = map['status'],
        merchantTransactionId = map['merchant_transaction_id'],
        transactionId = map['transaction_id'],
        user = map['user'];


  Map toMap(){
    return {
      'code': code ,
      'status': status ,
      'merchant_transaction_id' : merchantTransactionId,
      'transaction_id': transactionId,
      'user' : user
    };
  }

  Map toJson(){
    return{
      'code' : code,
      'status' : status,
      'merchant_transaction_id' : merchantTransactionId,
      'transaction_id' : transactionId,
      'user' : user,
    };
  }
}
