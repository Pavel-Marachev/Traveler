import 'package:traveler/data/data_providers/geographic_objects_provider.dart';
import 'package:traveler/data/models/geographic_objects_model.dart';

class Repository {
  final geographicApiProvider = GeographicObjectsProvider();

  Future<GeographicObjectsModel> fetchObjectsList(String requestMessage) =>
      geographicApiProvider.fetchObjectsList(requestMessage);
}
