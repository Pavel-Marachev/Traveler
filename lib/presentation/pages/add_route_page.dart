import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traveler/presentation/theme/constants.dart';
import 'package:traveler/business_logic/blocs/add_route_bloc/add_route_bloc.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class AddRoutePage extends StatefulWidget {
  const AddRoutePage({Key? key}) : super(key: key);

  @override
  State<AddRoutePage> createState() => _AddRoutePageState();
}

class _AddRoutePageState extends State<AddRoutePage> {
  late YandexMapController controller;
  final animation =
      const MapAnimation(type: MapAnimationType.smooth, duration: 2.0);
  final List<MapObject> mapObjects = [];
  final MapObjectId targetMapObjectId = const MapObjectId('target_placemark');
  late final Placemark placemark;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AddRouteBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Планирование маршрута',
            style: kTextStyleTitle,
          ),
          backgroundColor: kBackgroundWidgetColor.withOpacity(0.9),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(right: 20, left: 20, top: 20),
            child: BlocConsumer<AddRouteBloc, AddRouteState>(
              listener: (BuildContext context, state) async {
                if (state.point != null) {
                  FocusScope.of(context).unfocus();
                  final placemark = Placemark(
                      mapId: targetMapObjectId,
                      point: state.point!,
                      opacity: 0.7,
                      icon: PlacemarkIcon.single(PlacemarkIconStyle(
                          image: BitmapDescriptor.fromAssetImage(
                              'assets/images/place.png'))));
                  mapObjects.removeWhere((e) => e.mapId == targetMapObjectId);
                  mapObjects.add(placemark);
                  await controller.moveCamera(CameraUpdate.zoomTo(1),
                      animation: animation);
                  await controller.moveCamera(
                      CameraUpdate.newCameraPosition(
                          CameraPosition(target: state.point!)),
                      animation: animation);
                }
              },
              builder: (BuildContext context, state) {
                return Column(
                  children: [
                    TextField(
                      decoration: const InputDecoration(
                        labelText: 'Выберете город',
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blue,
                            width: 2,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black54,
                            width: 2,
                          ),
                        ),
                      ),
                      onSubmitted: (value) {
                        context
                            .read<AddRouteBloc>()
                            .add(InputTextSubmitted(value: value));
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 3,
                      child: YandexMap(
                        nightModeEnabled: false,
                        rotateGesturesEnabled: false,
                        mapObjects: mapObjects,
                        onMapCreated:
                            (YandexMapController yandexMapController) {
                          controller = yandexMapController;
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
