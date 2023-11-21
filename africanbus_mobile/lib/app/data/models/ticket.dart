class Billet {
  String id;
  String depart;
  String destination;
  double coutReservation;
  String compagnieTransport;
  String heureDepart;
  String heureArrivee;
  int nombrePlaceRestant ;
  String modeOffreVoyage;
  String categorieOffreVoyage ;
  String propriete1;
  String propriete2;

  Billet({ required this.id , required this.depart, required this.destination , required this.coutReservation , required this.compagnieTransport,
    required this.heureDepart , required this.heureArrivee , required this.nombrePlaceRestant , required this.modeOffreVoyage , required this.categorieOffreVoyage,
    required this.propriete1 , required this.propriete2
  });

  factory Billet.fromJson(Map<String , dynamic> json){
    return Billet(
      id: json['id'],
      depart: json['depart'],
      destination: json['destination'],
      coutReservation: json['coutReservation'],
      compagnieTransport: json['compagnieTransport'],
      heureDepart: json['heureDepart'],
      heureArrivee: json['heureArrivee'],
      nombrePlaceRestant: json['nombrePlaceRestant'],
      modeOffreVoyage: json['modeOffreVoyage'],
      categorieOffreVoyage: json['categorieOffreVoyage'],
      propriete1: json['propriete1'],
      propriete2: json['propriete2'],
    );
  }

  Billet.fromMap(Map map)
      :this.id = map['id'],
        this.depart = map['depart'],
        this.destination = map['destination'],
        this.coutReservation = map['coutReservation'],
        this.compagnieTransport = map['compagnieTransport'],
        this.heureDepart = map['heureDepart'],
        this.nombrePlaceRestant = map['nombrePlaceRestant'],
        this.heureArrivee = map['heureArrivee'],
        this.modeOffreVoyage = map['modeOffreVoyage'],
        this.categorieOffreVoyage = map['categorieOffreVoyage'],
        this.propriete1 = map['propriete1'],
        this.propriete2 = map['propriete2'];

  Map toMap() {
    return {
      'id': this.id,
      'depart': this.depart,
      'destination': this.destination,
      'coutReservation': this.coutReservation,
      'compagnieTransport': this.compagnieTransport,
      'heureDepart': this.heureDepart,
      'heureArrivee': this.heureArrivee,
      'nombrePlaceRestant': this.nombrePlaceRestant,
      'modeOffreVoyage': this.modeOffreVoyage,
      'categorieOffreVoyage': this.categorieOffreVoyage,
      'propriete1': this.propriete1,
      'propriete2': this.propriete2,
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
      'nombrePlaceRestant': nombrePlaceRestant,
      'modeOffreVoyage': modeOffreVoyage,
      'categorieOffreVoyage': categorieOffreVoyage,
      'propriete1': propriete1,
      'propriete2': propriete2,
    };
  }
}