class PassagersType{
  String id ;
  String typeDesignation ;

  PassagersType({ required this.id , required this.typeDesignation });

  factory PassagersType.fromJson(Map<String , dynamic> json){
    return PassagersType(
      id: json['id'],
      typeDesignation: json['typeDesignation'],
    );
  }

  PassagersType.fromMap(Map map)
      :this.id = map['id'],
        this.typeDesignation = map['typeDesignation'];

  Map toMap() {
    return {
      'id': this.id,
      'typeDesignation': this.typeDesignation,
    };
  }

  Map toJson() {
    return {
      'id': id,
      'typeDesignation': typeDesignation,
    };
  }
}