class City {
  String id ;
  String designation ;
  String pays ;

  City({ required this.id , required this.designation , required this.pays });

  factory City.fromJson(Map<String , dynamic> json){
    return City(
      id: json['id'],
      designation: json['typeDesignation'],
      pays: json['pays']
    );
  }

  City.fromMap(Map map)
      :this.id = map['id'],
        this.designation = map['designation'],
        this.pays = map['pays'];

  Map toMap() {
    return {
      'id': this.id,
      'designation': this.designation,
      'pays': this.pays,
    };
  }

  Map toJson() {
    return {
      'id': id,
      'designation': designation,
      'pays' : pays
    };
  }
}