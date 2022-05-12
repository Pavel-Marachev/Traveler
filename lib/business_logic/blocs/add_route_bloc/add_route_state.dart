part of 'package:traveler/business_logic/blocs/add_route_bloc/add_route_bloc.dart';

class AddRouteState {
  List<MapObject>? mapObjects;
  Point? point;
  bool isFirstZoom;

  AddRouteState({
    this.mapObjects,
    this.point,
    this.isFirstZoom = true,
  });

  AddRouteState copyWith({
    List<MapObject>? mapObjects,
    Point? point,
    bool? isFirstZoom,
  }) {
    return AddRouteState(
      mapObjects: mapObjects ?? this.mapObjects,
      point: point ?? this.point,
      isFirstZoom: isFirstZoom ?? this.isFirstZoom,
    );
  }
}
