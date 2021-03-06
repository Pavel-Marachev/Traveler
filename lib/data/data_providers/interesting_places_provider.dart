import 'dart:convert';
import 'package:http/http.dart' show Client;

import 'package:traveler/data/models/interesting_places_model.dart';
import 'package:traveler/data/models/place_information_model.dart';

class InterestingPlacesProvider {
  final Client _client = Client();
  final _apiKey = '5ae2e3f221c38a28845f05b6d0c453847a5f97818350fdc643584b79';

  Future<InterestingPlacesModel> fetchPlacesList(
      {required double lon, required double lat}) async {
    final response = await _client.get(Uri.parse(
        'https://api.opentripmap.com/0.1/ru/places/radius?radius=10000&lon=$lon&lat=$lat&kinds=interesting_places&format=geojson&apikey=$_apiKey'));
    if (response.statusCode == 200) {
      return InterestingPlacesModel.fromJson(json.decode(response.body));
    } else {
      return InterestingPlacesModel();
    }
  }

  Future<PlaceInformationModel> fetchPlaceInformation(String xid) async {
    final response = await _client.get(Uri.parse(
        'http://api.opentripmap.com/0.1/ru/places/xid/$xid?apikey=$_apiKey'));
    if (response.statusCode == 200) {
      return PlaceInformationModel.fromJson(json.decode(response.body));
    } else {
      return PlaceInformationModel();
    }
  }
}
