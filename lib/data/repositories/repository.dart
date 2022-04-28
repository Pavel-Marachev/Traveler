import 'package:traveler/data/data_providers/geographic_objects_provider.dart';
import 'package:traveler/data/data_providers/interesting_places_provider.dart';
import 'package:traveler/data/models/geographic_objects_model.dart';
import 'package:traveler/data/models/interesting_places_model.dart';

class Repository {
  final geographicApiProvider = GeographicObjectsProvider();
  final interestingPlacesProvider = InterestingPlacesProvider();

  Future<GeographicObjectsModel> fetchObjectsList(String requestMessage) =>
      geographicApiProvider.fetchObjectsList(requestMessage);

  Future<InterestingPlacesModel> fetchPlacesList() => interestingPlacesProvider.fetchPlacesList();
}
