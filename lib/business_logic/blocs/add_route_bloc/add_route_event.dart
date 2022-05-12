part of 'package:traveler/business_logic/blocs/add_route_bloc/add_route_bloc.dart';

abstract class AddRouteEvent {}

class InputCitySubmitted extends AddRouteEvent {
  String value;

  InputCitySubmitted(this.value) : super();
}

class InputPlaceSubmitted extends AddRouteEvent {
  String value;

  InputPlaceSubmitted(this.value) : super();
}
