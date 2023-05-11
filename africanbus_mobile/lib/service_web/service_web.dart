import 'package:africanbus_mobile/globalConfig/globalConst.dart';
import 'package:africanbus_mobile/models/city.dart';
import 'package:africanbus_mobile/models/categorieVoyageur.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


/*
  - Date : 10-05-2023
  - Author : Kouevi Ayite Emmanuel Herve
  - Description: Cette classe regroupe la liste des services web
 */

class ServiceWebApi{


  Future <List<City>>getTravelCities() async {
    final url = GlobalConst.remoteApiUrl +"villes/getAllCities";
    final response = await http.get(Uri.parse(url));
    print(response);
    if (response.statusCode == 200) {
      List<City> cities = [];
      cities = (json.decode(response.body)['data'] as List)
          .map((i) => City.fromJson(i))
          .toList();
      return cities;
    } else {
      throw Exception('Failed to load campaigns');
    }
  }

  Future <List<TypePassager>>getCategoryTravellerMocking() async{
    final url = 'http://192.168.1.10:8000/typePassagers.json';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List<TypePassager> typePassagers = [];
      typePassagers = (json.decode(response.body) as List)
          .map((i) => TypePassager.fromJson(i))
          .toList();
      return typePassagers;
    } else {
      throw Exception('Failed to load campaigns');
    }
  }

}