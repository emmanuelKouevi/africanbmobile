class ResponseTokenPayMeTrust {
  final int code ;
  final String status ;
  final String accessToken ;
  final String userMail ;
  final String tokenType ;
  final int expiresIn;

  ResponseTokenPayMeTrust({
    required this.code , required this.status ,
    required this.accessToken, required this.userMail ,
    required this.tokenType , required this.expiresIn
  });

  factory ResponseTokenPayMeTrust.fromJson(Map<String, dynamic> json) {
    return ResponseTokenPayMeTrust(
        code: json['code'],
        status: json['status'],
        accessToken: json['access_token'],
        userMail: json['user_email'],
        tokenType: json['token_type'],
        expiresIn: json['expires_in']
    );
  }

  ResponseTokenPayMeTrust.fromMap(Map map)
      :code = map['code'],
        status = map['status'],
        accessToken = map['access_token'],
        userMail = map['user_email'],
        tokenType = map['token_type'],
        expiresIn = map['expiresIn'];


  Map toMap(){
    return {
      'code': code ,
      'status': status ,
      'access_token': accessToken,
      'user_email': userMail,
      'token_type': tokenType,
      'expiresIn' : expiresIn,
    };
  }

  Map toJson(){
    return{
      'code' : code,
      'status' : status,
      'access_token': accessToken,
      'user_email': userMail,
      'token_type' : tokenType,
      'expiresIn' : expiresIn
    };
  }
}
