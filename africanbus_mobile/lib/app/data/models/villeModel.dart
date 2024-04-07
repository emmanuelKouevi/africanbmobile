class Ville{
  String createdAt;
  int id ;
  String designation ;
  String paysDesignation;
  int paysId;

  Ville({
    required this.id ,required this.designation, required this.paysDesignation ,
    required this.paysId, required this.createdAt
  });

  factory Ville.fromJson(Map<String , dynamic> json){
    return Ville(
      createdAt:json['createdAt'],
      id: json['id'],
      designation: json['designation'],
      paysDesignation: json['paysDesignation'],
      paysId: json['paysId'],
    );
  }

  Ville.fromMap(Map map)
      :this.id = map['id'],
        this.createdAt = map['createdAt'],
        this.designation = map['designation'],
        this.paysDesignation = map['paysDesignation'],
        this.paysId = map['paysId'];

  Map toMap() {
    return {
      'id': this.id,
      'isCreated': this.createdAt,
      'designation': this.designation,
      'paysDesignation': this.paysDesignation,
      'paysId': this.paysId,
    };
  }

  Map toJson() {
    return {
      'id': id,
      'createdAt': createdAt,
      'designation': designation,
      'paysDesignation': paysDesignation,
      'paysId': paysId
    };
  }
}