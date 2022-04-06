import 'dart:convert';
import 'package:http/http.dart' show Client;

import 'package:traveler/data/models/geographic_objects_model.dart';

class GeographicObjectsProvider {
  final Client _client = Client();
  final _apiKey = 'd9429fae-6941-4cd5-a682-6ce10d582976';

  Future<GeographicObjectsModel> fetchObjectsList(
      String? _requestMessage) async {
    final response = await _client.get(Uri.parse(
        'https://search-maps.yandex.ru/v1/?text=$_requestMessage&type=geo&lang=ru_RU&apikey=$_apiKey'));
    if (response.statusCode == 200) {
      return GeographicObjectsModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }
}
