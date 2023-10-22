import 'package:africanbus_mobile/app/data/models/ticket.dart';

class ReservationTicketModel{
  String designation;
  String description;
  Billet billet;

  ReservationTicketModel({ required this.designation , required this.description , required this.billet});

  factory ReservationTicketModel.fromJson(Map<String , dynamic> json){
    return ReservationTicketModel(
        designation: json['id'],
        description: json['depart'],
        billet: Billet.fromJson(json['destination']) ,
    );
  }

  ReservationTicketModel.fromMap(Map map)
      :this.designation = map['designation'],
        this.description = map['description'],
        this.billet = map['billet'];

  Map toMap() {
    return {
      'designation': this.designation,
      'description': this.description,
      'billet': this.billet,
    };
  }

  Map toJson() {
    return {
      'designation': designation,
      'description': description,
      'description': billet,
    };
  }
}