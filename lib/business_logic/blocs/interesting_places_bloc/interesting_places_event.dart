part of 'package:traveler/business_logic/blocs/interesting_places_bloc/interesting_places_bloc.dart';

abstract class InterestingPlacesEvent {}

class Initialization extends InterestingPlacesEvent {
  String value;

  Initialization(this.value) : super();
}

class TapOnInterestingPlace extends InterestingPlacesEvent {
  String xid;

  TapOnInterestingPlace(this.xid) : super();
}
