class TypePassager{
  int id ;
  String typeDesignation ;

  TypePassager({ required this.id , required this.typeDesignation });

  factory TypePassager.fromJson(Map<String , dynamic> json){
    return TypePassager(
      id: json['id'],
      typeDesignation: json['typeDesignation'],
    );
  }

  TypePassager.fromMap(Map map)
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