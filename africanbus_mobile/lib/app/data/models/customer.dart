class CustomerApp{
  String id;
  String firstname ;
  String lastname;
  String phoneNumber;

  CustomerApp({
    required this.id ,required this.firstname , required this.lastname, required this.phoneNumber ,
  });

  factory CustomerApp.fromJson(Map<String , dynamic> json){
    return CustomerApp(
      id: json['id'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      phoneNumber: json['phoneNumber'],
    );
  }

  CustomerApp.fromMap(Map map)
      :this.id = map['id'],
        this.firstname = map['firstname'],
        this.lastname = map['lastname'],
        this.phoneNumber = map['phoneNumber'];

  Map toMap() {
    return {
      'id': this.id,
      'firstname': this.firstname,
      'lastname': this.lastname,
      'phoneNumber':this.phoneNumber,
    };
  }

  Map toJson() {
    return {
      'id': id,
      'firstname': firstname,
      'lastname': lastname,
      'phoneNumber': phoneNumber,
    };
  }
}


class CustomerA{
  String name;
  String email;
  String phoneNumber;

  CustomerA({
    required this.name ,required this.email ,required this.phoneNumber ,
  });

  factory CustomerA.fromJson(Map<String , dynamic> json){
    return CustomerA(
      name: json['firstname'],
      email: json['lastname'],
      phoneNumber: json['phoneNumber'],
    );
  }

  CustomerA.fromMap(Map map)
      :this.name = map['name'],
        this.email = map['email'],
        this.phoneNumber = map['phoneNumber'];

  Map toMap() {
    return {
      'name': this.name,
      'email': this.email,
      'phoneNumber':this.phoneNumber,
    };
  }

  Map toJson() {
    return {
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
    };
  }
}