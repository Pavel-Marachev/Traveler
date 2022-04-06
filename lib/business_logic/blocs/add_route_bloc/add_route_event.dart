part of 'package:traveler/business_logic/blocs/add_route_bloc/add_route_bloc.dart';

abstract class AddRouteEvent {}

class InputTextSubmitted extends AddRouteEvent {
  String value;

  InputTextSubmitted({required this.value}) : super();
}
