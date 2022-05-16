part of 'package:traveler/business_logic/blocs/interesting_places_bloc/interesting_places_bloc.dart';

class InterestingPlacesState {
  List<Features>? places;
  List<Features>? favoritePlaces;
  List<PlaceInformationModel>? foundPlaces;
  bool isLoadingAllPlaces;
  bool isLoadingPlaceInformation;

  InterestingPlacesState({
    this.places,
    this.favoritePlaces,
    this.foundPlaces,
    this.isLoadingAllPlaces = true,
    this.isLoadingPlaceInformation = true,
  });

  InterestingPlacesState copyWith({
    List<Features>? places,
    List<Features>? favoritePlaces,
    List<PlaceInformationModel>? foundPlaces,
    bool? isLoadingAllPlaces,
    bool? isLoadingPlaceInformation,
  }) {
    return InterestingPlacesState(
      places: places ?? this.places,
      favoritePlaces: favoritePlaces ?? this.favoritePlaces,
      foundPlaces: foundPlaces ?? this.foundPlaces,
      isLoadingAllPlaces: isLoadingAllPlaces ?? this.isLoadingAllPlaces,
      isLoadingPlaceInformation:
          isLoadingPlaceInformation ?? this.isLoadingPlaceInformation,
    );
  }
}
