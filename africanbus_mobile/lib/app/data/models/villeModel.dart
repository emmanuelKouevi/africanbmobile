class Ville{
  int id ;
  String designation ;
  String paysDesignation ;

  Ville({
    required this.id ,required this.designation, required this.paysDesignation ,
  });

  factory Ville.fromJson(Map<String , dynamic> json){
    return Ville(
      id: json['id'],
      designation: json['designation'],
      paysDesignation: json['paysDesignation'],
    );
  }

  Ville.fromMap(Map map)
      :this.id = map['id'],
        this.designation = map['designation'],
        this.paysDesignation = map['paysDesignation'];

  Map toMap() {
    return {
      'id': this.id,
      'designation': this.designation,
      'paysDesignation': this.paysDesignation,
    };
  }

  Map toJson() {
    return {
      'id': id,
      'designation': designation,
      'paysDesignation': paysDesignation,
    };
  }
}