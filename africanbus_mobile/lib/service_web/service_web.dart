import 'package:africanbus_mobile/globalConfig/globalConst.dart';
import 'package:africanbus_mobile/models/city.dart';
import 'package:africanbus_mobile/models/passagerType.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ServiceWebApi{
  Future <List<City>>getTravelCities() async {
    final url = GlobalConst.remoteApiUrl +"villes.json";
    final response = await http.get(Uri.parse(url));
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

  Future <List<PassagersType>>getTypePassagers() async {
    final url = GlobalConst.remoteApiUrl +"typePassagers.json";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List<PassagersType> typePassagers = [];
      typePassagers = (json.decode(response.body)['data'] as List)
          .map((i) => PassagersType.fromJson(i))
          .toList();
      return typePassagers;
    } else {
      throw Exception('Failed to load campaigns');
    }
  }
}