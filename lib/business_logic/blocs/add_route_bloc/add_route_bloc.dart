import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traveler/data/models/geographic_objects_model.dart';
import 'package:traveler/data/repositories/repository.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

part 'package:traveler/business_logic/blocs/add_route_bloc/add_route_event.dart';
part 'package:traveler/business_logic/blocs/add_route_bloc/add_route_state.dart';

class AddRouteBloc extends Bloc<AddRouteEvent, AddRouteState> {
  AddRouteBloc() : super(AddRouteState()) {
    on<InputTextSubmitted>(fetchAllObjects);
  }

  final _repository = Repository();
  double? _latitude;
  double? _longitude;
  Point? point;

  Future<void> fetchAllObjects(
      InputTextSubmitted event, Emitter<AddRouteState> emit) async {
    GeographicObjectsModel itemModel =
        await _repository.fetchObjectsList(event.value);
        if (itemModel.features!.isNotEmpty) {
          _latitude = itemModel.features?[0].geometry?.coordinates?[1];
          _longitude = itemModel.features?[0].geometry?.coordinates?[0];
        }
    if (_latitude != null && _longitude != null) {
      point = Point(latitude: _latitude!, longitude: _longitude!);
      emit(state.copyWith(point: point));
    }
  }
}
