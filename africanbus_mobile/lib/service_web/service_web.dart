import 'package:africanbus_mobile/globalConfig/globalConst.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../app/data/models/categorieVoyageur.dart';
import '../app/data/models/city.dart';
import '../app/data/models/ticket.dart';



/*
  - Date : 10-05-2023
  - Author : Kouevi Ayite Emmanuel Herve
  - Description: Cette classe regroupe la liste des services web
 */

class ServiceWebApi{

  // RECUPERER LA LISTE DES VILLES DEPUIS UN SERVICE WEB
  Future <List<City>>getTravelCities() async {
    final url = GlobalConst.remoteApiUrl +"villes.json";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List<City> cities = [];
      cities = (json.decode(response.body) as List)
          .map((i) => City.fromJson(i))
          .toList();
      return cities;
    } else {
      throw Exception('Failed to load campaigns');
    }
  }


  // RECUPERER LA LISTE DES CATEGORIE VOYAGEUR DEPUIS UN SERVICE WEB
  Future <List<TypePassager>>getCategoryTravellerMocking() async{
    final url = GlobalConst.remoteApiUrl +"typePassagers.json";
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

  // RECUPERER LA LISTE DES OFFRES DE VOYAGES DISPONIBLES DEPUIS UN SERVICE WEB
  Future <List<Billet>>getOffersTravels() async{
    final url = GlobalConst.remoteApiUrl +"billet.json";
    final response = await http.get(Uri.parse(url));
    print(response);
    if (response.statusCode == 200) {
      List<Billet> billetsList = [];
      billetsList = (json.decode(response.body) as List)
          .map((i) => Billet.fromJson(i))
          .toList();
      print(billetsList);
      return billetsList;
    } else {
      throw Exception('Failed to load campaigns');
    }
  }

}