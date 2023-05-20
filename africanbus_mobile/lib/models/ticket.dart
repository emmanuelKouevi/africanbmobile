class Billet {
  int id;
  String depart;
  String destination;
  double coutReservation;
  String compagnieTransport;
  String heureDepart;
  String heureArrivee;

  Billet({ required this.id , required this.depart, required this.destination , required this.coutReservation , required this.compagnieTransport,
          required this.heureDepart , required this.heureArrivee});

  factory Billet.fromJson(Map<String , dynamic> json){
    return Billet(
        id: json['id'],
        depart: json['depart'],
        destination: json['destination'],
        coutReservation: json['coutReservation'],
        compagnieTransport: json['compagnieTransport'],
        heureDepart: json['heureDepart'],
        heureArrivee: json['heureArrivee']
    );
  }

  Billet.fromMap(Map map)
      :this.id = map['id'],
        this.depart = map['depart'],
        this.destination = map['destination'],
        this.coutReservation = map['coutReservation'],
        this.compagnieTransport = map['compagnieTransport'],
        this.heureDepart = map['heureDepart'],
        this.heureArrivee = map['heureArrivee'];

  Map toMap() {
    return {
      'id': this.id,
      'depart': this.depart,
      'destination': this.destination,
      'coutReservation': this.coutReservation,
      'compagnieTransport': this.compagnieTransport,
      'heureDepart': this.heureDepart,
      'heureArrivee': this.heureArrivee,
    };
  }

  Map toJson() {
    return {
      'id': id,
      'depart': depart,
      'destination': destination,
      'coutReservation': coutReservation,
      'compagnieTransport': compagnieTransport,
      'heureDepart': heureDepart,
      'heureArrivee': heureArrivee,
    };
  }
}