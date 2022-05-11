part of 'package:traveler/business_logic/blocs/add_route_bloc/add_route_bloc.dart';

class AddRouteState {
  List<MapObject>? mapObjects;
  Point? point;

  AddRouteState({
    this.mapObjects,
    this.point,
  });

  AddRouteState copyWith({
    List<MapObject>? mapObjects,
    Point? point,
  }) {
    return AddRouteState(
      mapObjects: mapObjects ?? this.mapObjects,
      point: point ?? this.point,
    );
  }
}
