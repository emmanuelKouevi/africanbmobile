import 'package:africanbus_mobile/app/data/models/reservationBillet.dart';
import 'package:africanbus_mobile/global_config/globalConst.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../app/data/models/categorieVoyageur.dart';
import '../app/data/models/city.dart';
import '../app/data/models/ticket.dart';


/**
  * Date : 10-05-2023
  * Author : Kouevi Ayite Emmanuel Herve
  * Description: Cette classe regroupe la liste des services webs
 */

class ServiceWebApi{

  // RECUPERER LA LISTE DES VILLES DEPUIS UN SERVICE WEB
  Future <List<City>>getTravelCities() async {
    final url = GlobalConst.remoteApiDev +"villes.json";
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
    final url = GlobalConst.remoteApiDev +"typePassagers.json";
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
    final url = GlobalConst.remoteApiDev +"billet.json";
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

  // OBTENIR LA LISTE DES OFFRES DE VOYAGES PAR CRITERES
  //TODO: Insérer le bon modele de reponse pour cet service web.
  Future<void>obtenirOffreVoyageParCritere(String villeDepart,String villeDestination,String dateDepart ) async{
    final url = GlobalConst.remoteApiDev +"offreVoyages/getOffreVoyageByCriteria";
    final response = await http.post(Uri.parse(url),
      body: jsonEncode({
        'villeDepart':villeDepart,
        'villeDestination':villeDestination,
        'dateDepart':dateDepart,
      })
    );
    if (response.statusCode == 200) {
      dynamic offreVoyageList ;
      offreVoyageList = (json.decode(response.body)['data'] as List);
      return offreVoyageList;
    } else {
      throw Exception('Failed to load campaigns');
    }
  }


  // RESERVATION UN BILLET DE VOYAGE
  //TODO: Insérer le bon modele de reponse pour cet service web.
  Future<void>reserverBilletVoyage(ReservationBillet reservationBillet) async{
    final url = GlobalConst.remoteApiDev +"reservationBilletVoyages";
    final response = await http.post(Uri.parse(url),
        body: jsonEncode(reservationBillet)
    );
    if (response.statusCode == 200) {
      dynamic reservationResponse ;
      reservationResponse = (json.decode(response.body)['data'] as List);
      return reservationResponse;
    } else {
      throw Exception('Failed to load campaigns');
    }
  }

  // OBTENIR LA LISTE DES HISTORIQUES PAR IDENTIFIANT UTILISATEUR
  //TODO: Insérer le bon modele de reponse pour cet service web.
  Future<void>obtenirHistoriqueParUtilisateur(String userId) async{
    final url = GlobalConst.remoteApiDev +"historiquePaiements/getHistoriquePaiementByIdentifiantUnique";
    final response = await http.post(Uri.parse(url),
        body: jsonEncode({
          "data":{
            "identifiantUnique": userId
          }
        })
    );
    if (response.statusCode == 200) {
      dynamic historiques ;
      historiques = (json.decode(response.body)['data'] as List);
      return historiques;
    } else {
      throw Exception('Failed to load campaigns');
    }
  }

}