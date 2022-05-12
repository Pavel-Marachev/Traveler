import 'package:traveler/data/data_providers/geographic_objects_provider.dart';
import 'package:traveler/data/data_providers/interesting_places_provider.dart';
import 'package:traveler/data/models/geographic_objects_model.dart';
import 'package:traveler/data/models/interesting_places_model.dart';
import 'package:traveler/data/models/organizations_model.dart';
import 'package:traveler/data/models/place_information_model.dart';

class Repository {
  final geographicApiProvider = GeographicObjectsProvider();
  final interestingPlacesProvider = InterestingPlacesProvider();

  Future<GeographicObjectsModel> fetchObjectsList(String requestMessage) =>
      geographicApiProvider.fetchObjectsList(requestMessage);

  Future<OrganizationsModel> fetchOrganization(String requestMessage) =>
      geographicApiProvider.fetchOrganization(requestMessage);

  Future<InterestingPlacesModel> fetchPlacesList(
          {required double lon, required double lat}) =>
      interestingPlacesProvider.fetchPlacesList(lon: lon, lat: lat);

  Future<PlaceInformationModel> fetchPlaceInformation(String xid) =>
      interestingPlacesProvider.fetchPlaceInformation(xid);
}
