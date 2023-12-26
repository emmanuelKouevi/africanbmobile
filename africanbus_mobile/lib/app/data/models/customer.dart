class Customer{
  String id;
  String firstname ;
  String lastname;
  String phoneNumber;

  Customer({
    required this.id ,required this.firstname , required this.lastname, required this.phoneNumber ,
  });

  factory Customer.fromJson(Map<String , dynamic> json){
    return Customer(
      id: json['id'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      phoneNumber: json['phoneNumber'],
    );
  }

  Customer.fromMap(Map map)
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