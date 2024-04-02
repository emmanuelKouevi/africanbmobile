import 'dart:convert';
import 'package:http/http.dart' as http ;

import '../../../global_config/globalConst.dart';

class CommonServiceWeb {

  final myObject = {};

  //Récupérer la liste des villes
  Future<dynamic>obtenirListeDesVilles() async{
    dynamic villesList = "";
    final url = GlobalConst.remoteApiProd +"villes/getAllCities";
    final body = jsonEncode(myObject);
    final response = await http.post(Uri.parse(url) , body: body , headers: GlobalConst.requestHeaders);
    try{
      if(response.statusCode == 200){
        final result = jsonDecode(response.body);
        if(result['status']['code'] == '800'){
          villesList = result['status']['item'];
        }else{
          villesList = "";
        }
      }
    }catch(e){
      villesList = "";
    }
    return villesList;
  }
}