import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traveler/data/models/interesting_places_model.dart';
import 'package:traveler/data/models/geographic_objects_model.dart';
import 'package:traveler/data/models/place_information_model.dart';
import 'package:traveler/data/repositories/repository.dart';

part 'package:traveler/business_logic/blocs/interesting_places_bloc/interesting_places_event.dart';

part 'package:traveler/business_logic/blocs/interesting_places_bloc/interesting_places_state.dart';

class InterestingPlacesBloc
    extends Bloc<InterestingPlacesEvent, InterestingPlacesState> {
  InterestingPlacesBloc() : super(InterestingPlacesState()) {
    on<Initialization>(fetchPlacesList);
    on<TapOnInterestingPlace>(fetchPlaceInformation);
    on<AddedToFavorite>(addToFavoritePlaces);
    on<DeletedFromFavorite>(deleteFromFavoritePlaces);
  }

  final _repository = Repository();
  double? _latitude;
  double? _longitude;
  List<Features> favoritePlaces = [];
  List<PlaceInformationModel> foundPlaces = [];

  Future<void> fetchPlacesList(
      Initialization event, Emitter<InterestingPlacesState> emit) async {
    emit(state.copyWith(isLoadingAllPlaces: true));
    GeographicObjectsModel geographicObjectsModel =
        await _repository.fetchObjectsList(event.value);
    if (geographicObjectsModel.features!.isNotEmpty) {
      _latitude = geographicObjectsModel.features?[0].geometry?.coordinates?[1];
      _longitude =
          geographicObjectsModel.features?[0].geometry?.coordinates?[0];
    }
    if (_latitude != null && _longitude != null) {
      InterestingPlacesModel itemModel =
          await _repository.fetchPlacesList(lon: _longitude!, lat: _latitude!);
      if (itemModel.features!.isNotEmpty) {
        emit(state.copyWith(
            places: itemModel.features, isLoadingAllPlaces: false));
      }
    }
  }

  Future<void> fetchPlaceInformation(
      TapOnInterestingPlace event, Emitter<InterestingPlacesState> emit) async {
    emit(state.copyWith(isLoadingPlaceInformation: true));
    PlaceInformationModel? itemModel;
    if (state.foundPlaces != null) {
      itemModel = state.foundPlaces!.firstWhere(
          (element) => element.xid == event.xid,
          orElse: () => PlaceInformationModel());
    }
    if (itemModel?.xid == null) {
      itemModel = await _repository.fetchPlaceInformation(event.xid);
      foundPlaces.add(itemModel);
    }

    emit(state.copyWith(
      isLoadingPlaceInformation: false,
      foundPlaces: foundPlaces,
    ));
  }

  void addToFavoritePlaces(
      AddedToFavorite event, Emitter<InterestingPlacesState> emit) {
    if (!favoritePlaces.contains(state.places![event.index])) {
      favoritePlaces.add(state.places![event.index]);
    }
    emit(state.copyWith(favoritePlaces: favoritePlaces));
  }

  void deleteFromFavoritePlaces(
      DeletedFromFavorite event, Emitter<InterestingPlacesState> emit) {
    favoritePlaces
        .removeWhere((element) => element.properties!.xid == event.xid);
    emit(state.copyWith(favoritePlaces: favoritePlaces));
  }
}
