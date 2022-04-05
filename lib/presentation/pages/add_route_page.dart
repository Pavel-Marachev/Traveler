import 'package:flutter/material.dart';
import 'package:traveler/data/models/geographic_objects_model.dart';
import 'package:traveler/data/repositories/repository.dart';
import 'package:traveler/presentation/theme/constants.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class AddRoutePage extends StatefulWidget {
  const AddRoutePage({Key? key}) : super(key: key);

  @override
  State<AddRoutePage> createState() => _AddRoutePageState();
}

class _AddRoutePageState extends State<AddRoutePage> {
  late YandexMapController controller;
  Point? _point;
  final animation =
      const MapAnimation(type: MapAnimationType.smooth, duration: 2.0);

  final _repository = Repository();
  fetchAllObjects() async {
    GeographicObjectsModel itemModel = await _repository.fetchObjectsList();
    print(itemModel.properties);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          child: Column(
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
                onChanged: (value) {
                  fetchAllObjects();
                  _point = Point(latitude: 52.9650800, longitude: 36.0784900);
                },
                onSubmitted: (value) async {
                  if (_point != null) {
                    FocusScope.of(context).unfocus();
                    await controller.moveCamera(
                        CameraUpdate.newCameraPosition(
                            CameraPosition(target: _point!)),
                        animation: animation);
                  }
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
                  onMapCreated: (YandexMapController yandexMapController) {
                    controller = yandexMapController;
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
