part of 'package:traveler/business_logic/blocs/interesting_places_bloc/interesting_places_bloc.dart';

class InterestingPlacesState {
  List<Features>? places;
  List<Features>? favoritePlaces;
  bool isLoadingAllPlaces;
  bool isLoadingPlaceInformation;
  String? image;
  String? text;

  InterestingPlacesState({
    this.places,
    this.favoritePlaces,
    this.isLoadingAllPlaces = true,
    this.isLoadingPlaceInformation = true,
    this.image,
    this.text,
  });

  InterestingPlacesState copyWith({
    List<Features>? places,
    List<Features>? favoritePlaces,
    bool? isLoadingAllPlaces,
    bool? isLoadingPlaceInformation,
    String? image,
    String? text,
  }) {
    return InterestingPlacesState(
      places: places ?? this.places,
      favoritePlaces: favoritePlaces ?? this.favoritePlaces,
      isLoadingAllPlaces: isLoadingAllPlaces ?? this.isLoadingAllPlaces,
      isLoadingPlaceInformation:
          isLoadingPlaceInformation ?? this.isLoadingPlaceInformation,
      image: image,
      text: text,
    );
  }
}
