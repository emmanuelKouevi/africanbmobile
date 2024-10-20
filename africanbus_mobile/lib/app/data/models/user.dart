class User{
  final int?  compagnieTransportId;
  final int? id;
  final bool? isActif;
  final String? createdAt;
  final String? login;
  final String? email;
  final String? nom;
  final String? prenoms;
  final String? token;

  const User({this.compagnieTransportId , this.id, this.isActif, this.createdAt,
    this.login, this.email, this.nom, this.prenoms, this.token
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      compagnieTransportId: json['compagnieTransportId'],
      id: json['id'],
      isActif: json['isActif'],
      createdAt: json['createdAt'],
      login: json['login'],
      email: json['email'],
      nom: json['nom'],
      prenoms: json['prenoms'],
      token: json['token'],
    );
  }

  User.fromMap(Map map)
      :id = map['id'],
        compagnieTransportId = map['compagnieTransportId'],
        isActif = map['isActif'],
        createdAt = map['createAt'],
        login = map['login'],
        email = map['email'],
        nom = map['nom'],
        prenoms = map['prenoms'],
        token = map['token'];


  Map toMap(){
    return {
      'id': id,
      'compagnieTransportId': compagnieTransportId,
      'isActif':isActif,
      'createAt': createdAt,
      'login': login,
      'email': email,
      'nom': nom,
      'prenoms': prenoms,
      'token': token,
    };
  }

  Map toJson(){
    return{
      'id': id,
      'compagnieTransportId': compagnieTransportId,
      'isActif':isActif,
      'createAt': createdAt,
      'login': login,
      'email': email,
      'nom': nom,
      'prenoms': prenoms,
      'token': token,
    };
  }
}