class UserPayment{
  final String name ;
  final String email ;
  final String phoneNumber ;

  const UserPayment({ required this.name , required this.email , required this.phoneNumber });

  factory UserPayment.fromJson(Map<String, dynamic> json) {
    return UserPayment(
      name: json['name'],
      email: json['email'],
      phoneNumber: json['phone_number'],
    );
  }

  UserPayment.fromMap(Map map)
      :name = map['name'],
        email = map['email'],
        phoneNumber = map['phone_number'];


  Map toMap(){
    return {
      'name': name ,
      'email': email ,
      'phone_number': phoneNumber
    };
  }

  Map toJson(){
    return{
      'name' : name,
      'email' : email,
      'phone_number' : phoneNumber,
    };
  }
}
