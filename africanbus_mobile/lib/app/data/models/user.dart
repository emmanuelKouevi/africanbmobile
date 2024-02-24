class User{
  String id ;
  String firstname;
  String lastname ;
  String email;
  String phoneNumber;

  User({this.id = "" , this.lastname = "" ,  this.firstname = "" , required this.email , this.phoneNumber = "" });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
    );
  }

  User.fromMap(Map map)
      :id = map['id'],
        firstname = map['firstname'],
        lastname = map['lastname'],
        email = map['email'],
        phoneNumber = map['phoneNumber'];


  Map toMap(){
    return {
      'id': id,
      'firstname': firstname,
      'lastname': lastname,
      'email': email ,
      'phoneNumber': phoneNumber
    };
  }

  Map toJson(){
    return{
      'id' : id,
      'firstname' : firstname,
      'lastname' : lastname,
      'email' : email,
      'phoneNumber' : phoneNumber,
    };
  }
}