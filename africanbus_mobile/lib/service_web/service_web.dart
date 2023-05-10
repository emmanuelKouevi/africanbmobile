import 'package:africanbus_mobile/globalConfig/globalConst.dart';
import 'package:africanbus_mobile/models/city.dart';
import 'package:africanbus_mobile/models/passagerType.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ServiceWebApi{

  List<TypePassager> parsePassager(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<TypePassager>((json) =>TypePassager.fromJson(json)).toList();
  }
  Future<List<TypePassager>> fetchPassagers() async {
    final response = await http.get(Uri.parse('http://localhost:8000/typePassagers.json'));
    print(response.body);
    if (response.statusCode == 200) {
      return parsePassager(response.body);
    } else {
      throw Exception('Unable to fetch products from the REST API');
    }
  }

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

  Future <List<TypePassager>>getTypePassagers() async {
    final url = GlobalConst.remoteApiUrl +"typePassagers.json";
    print('Adresse URL : $url');
    final response = await http.get(Uri.parse(url));
    print(response);
    if (response.statusCode == 200) {
      List<TypePassager> typePassagers = [];
      typePassagers = (json.decode(response.body)['data'] as List)
          .map((i) => TypePassager.fromJson(i))
          .toList();
      print('Le nombre de passager vaut ${typePassagers.length}');
      return typePassagers;
    } else {
      throw Exception('Failed to load campaigns');
    }
  }
}