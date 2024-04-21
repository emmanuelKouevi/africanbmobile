import 'package:africanbus_mobile/app/data/models/ticket.dart';
import 'customer.dart';

class ReservationBillet{
  int id;
  String designation;
  String description;
  Billet billet ;
  bool isForOtherPerson;
  CustomerApp customer;

  ReservationBillet({
    required this.id , required this.designation , required this.description ,
    required this.billet , required this.isForOtherPerson , required this.customer
  });

  factory ReservationBillet.fromJson(Map<String , dynamic> json){
    return ReservationBillet(
        id: json['id'],
        designation: json['designation'],
        description: json['description'],
        billet: Billet.fromJson(json['billet']),
        isForOtherPerson: json['isForOtherPerson'],
        customer: CustomerApp.fromJson(json['customer']),
    );
  }

  ReservationBillet.fromMap(Map map)
      :this.id = map['id'],
        this.designation = map['designation'],
        this.description = map['description'],
        this.billet = map['billet'],
        this.isForOtherPerson = map['isForOtherPerson'],
        this.customer = map['customer'];

  Map toMap() {
    return {
      'id': this.id,
      'designation': this.designation,
      'description': this.description,
      'billet':this.billet,
      'isForOtherPerson' : this.isForOtherPerson,
      'customer': this.customer,
    };
  }

  Map toJson() {
    return {
      'id': id,
      'designation': designation,
      'description' : description,
      'billet': billet,
      'isForOtherPerson': isForOtherPerson,
      'customer': customer
    };
  }
}