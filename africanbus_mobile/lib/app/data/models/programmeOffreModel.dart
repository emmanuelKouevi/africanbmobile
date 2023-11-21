class ProgrammeOffre{
  String programmeDesignation;
  int nombrePlace;
  String categorieVoyageur;
  String gareDesignation;
  String offreVoyageDesignation;

  ProgrammeOffre({
    required this.programmeDesignation , required this.nombrePlace,
    required this.categorieVoyageur , required this.gareDesignation,
    required this.offreVoyageDesignation
  });

  factory ProgrammeOffre.fromJson(Map<String , dynamic> json){
    return ProgrammeOffre(
      programmeDesignation: json['programmeDesignation'],
      nombrePlace: json['nombrePlace'],
      categorieVoyageur: json['categorieVoyageur'],
      gareDesignation: json['gareDesignation'],
      offreVoyageDesignation: json['offreVoyageDesignation'],
    );
  }

  ProgrammeOffre.fromMap(Map map)
      :this.programmeDesignation = map['programmeDesignation'],
        this.nombrePlace = map['nombrePlace'],
        this.categorieVoyageur = map['categorie'],
        this.gareDesignation = map['gareDesignation'],
        this.offreVoyageDesignation = map['offreVoyageDesignation'];

  Map toMap() {
    return {
      'programmeDesignation': this.programmeDesignation,
      'nombrePlace': this.nombrePlace,
      'categorieVoyageur': this.categorieVoyageur,
      'gareDesignation' : this.gareDesignation,
      'offreVoyageDesignation' :this.offreVoyageDesignation,
    };
  }

  Map toJson() {
    return {
      'programmeDesignation': programmeDesignation,
      'nombrePlace': nombrePlace,
      'categorieVoyageur': categorieVoyageur,
      'gareDesignation' : gareDesignation,
      'offreVoyageDesignation' :offreVoyageDesignation,
    };
  }
}