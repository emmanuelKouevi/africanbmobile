class OffreVoyageModel{
  final String? compagnieTransportRaisonSociale;
  final String? description;
  final String? designation;
  final String? isActif;
  final String? villeDepartDesignation;
  final String? villeDestinationDesignation;
  final String? typeOffreVoyageDesignation;

  OffreVoyageModel({
    this.compagnieTransportRaisonSociale , this.description, this.designation, this.isActif, this.typeOffreVoyageDesignation,
    this.villeDestinationDesignation , this.villeDepartDesignation,
  });

  factory OffreVoyageModel.fromJson(Map<String , dynamic> json){
    return OffreVoyageModel(
      compagnieTransportRaisonSociale: json['compagnieTransportRaisonSociale'],
      designation: json['designation'],
      description: json['description'],
      isActif: json['isActif'],
      typeOffreVoyageDesignation: json['typeOffreVoyageDesignation'],
      villeDepartDesignation: json['villeDepartDesignation'],
      villeDestinationDesignation: json['villeDestinationDesignation'],
    );
  }

  OffreVoyageModel.fromMap(Map map)
      :this.compagnieTransportRaisonSociale = map['compagnieTransportRaisonSociale'],
        this.designation = map['designation'],
        this.description = map['description:'],
        this.isActif = map['isActif'],
        this.typeOffreVoyageDesignation = map['typeOffreVoyageDesignation'],
        this.villeDepartDesignation = map['villeDepartDesignation'],
        this.villeDestinationDesignation = map['villeDestinationDesignation'];

  Map toMap() {
    return {
      'compagnieTransportRaisonSociale': this.compagnieTransportRaisonSociale,
      'designation': this.designation,
      'description': this.description,
      'isActif' : this.isActif,
      'typeOffreVoyageDesignation' :this.typeOffreVoyageDesignation,
      'villeDepartDesignation' :this.villeDepartDesignation ,
      'villeDestinationDesignation' :this.villeDestinationDesignation,
    };
  }

  Map toJson() {
    return {
      'compagnieTransportRaisonSociale': compagnieTransportRaisonSociale,
      'designation': designation,
      'description': description,
      'isActif' : isActif,
      'typeOffreVoyageDesignation' :typeOffreVoyageDesignation,
      'villeDepartDesignation' : villeDepartDesignation,
      'villeDestinationDesignation' : villeDestinationDesignation,
    };
  }
}