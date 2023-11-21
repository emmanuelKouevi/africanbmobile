class CritereOffreVoyage{
  String villeDepart;
  int villeDestination;
  String dateDepart;

  CritereOffreVoyage({
    required this.villeDepart ,required this.villeDestination, required this.dateDepart ,
  });

  factory CritereOffreVoyage.fromJson(Map<String , dynamic> json){
    return CritereOffreVoyage(
      villeDepart: json['villeDepart'],
      villeDestination: json['villeDestination'],
      dateDepart: json['dateDepart'],
    );
  }

  CritereOffreVoyage.fromMap(Map map)
      :this.villeDepart = map['villeDepart'],
        this.villeDestination = map['villeDestination'],
        this.dateDepart = map['dateDepart'];

  Map toMap() {
    return {
      'villeDepart': this.villeDepart,
      'villeDestination': this.villeDestination,
      'dateDepart': this.dateDepart,
    };
  }

  Map toJson() {
    return {
      'villeDepart': villeDepart,
      'villeDestination': villeDestination,
      'dateDepart': dateDepart,
    };
  }
}