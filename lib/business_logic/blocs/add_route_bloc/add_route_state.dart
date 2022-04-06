part of 'package:traveler/business_logic/blocs/add_route_bloc/add_route_bloc.dart';

class AddRouteState {
  Point? point;

  AddRouteState({
    this.point,
  });

  AddRouteState copyWith({
    Point? point,
  }) {
    return AddRouteState(
      point: point ?? this.point,
    );
  }
}
