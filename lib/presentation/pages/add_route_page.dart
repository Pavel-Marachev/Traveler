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
  late final Placemark placeMark;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AddRouteBloc(),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: const Alignment(0.5, 1),
            end: const Alignment(0.5, -1),
            colors: <Color>[
              kMainColor,
              kBackgroundWidgetColor.withOpacity(0.9),
            ],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.only(right: 20, left: 20, top: 20),
                child: BlocConsumer<AddRouteBloc, AddRouteState>(
                  listener: (BuildContext context, state) async {
                    if (state.point != null) {
                      FocusScope.of(context).unfocus();
                      placeMark = Placemark(
                          mapId: targetMapObjectId,
                          point: state.point!,
                          opacity: 0.7,
                          icon: PlacemarkIcon.single(PlacemarkIconStyle(
                              image: BitmapDescriptor.fromAssetImage(
                                  'assets/images/place.png'))));
                      mapObjects.removeWhere((e) => e.mapId == targetMapObjectId);
                      mapObjects.add(placeMark);
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
                          style: kTextStyleTitle.copyWith(fontSize: 16),
                          decoration: InputDecoration(
                            labelStyle: kTextStyleTitle.copyWith(fontSize: 16),
                            labelText: 'Выберете город',
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                color: kWidgetColor,
                                width: 2,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                color: kWidgetColor,
                                width: 2,
                              ),
                            ),
                          ),
                          onSubmitted: (value) {
                            if(value.isNotEmpty){
                              context
                                  .read<AddRouteBloc>()
                                  .add(InputTextSubmitted(value: value));
                            }
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height / 3,
                          decoration: BoxDecoration(
                            color: kInactiveWidgetColor,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
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
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
