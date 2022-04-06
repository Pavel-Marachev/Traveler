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
            child: Column(
              children: [
                BlocBuilder<AddRouteBloc, AddRouteState>(
                  builder: (BuildContext context, state) {
                    return TextField(
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
                      onSubmitted: (value) async {
                        context
                            .read<AddRouteBloc>()
                            .add(InputTextSubmitted(value: value));
                          if (state.point != null) {
                            FocusScope.of(context).unfocus();
                            await controller.moveCamera(CameraUpdate.zoomTo(1),
                                animation: animation);
                            await controller.moveCamera(
                                CameraUpdate.newCameraPosition(
                                    CameraPosition(target: state.point!)),
                                animation: animation);
                          }
                      },
                    );
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
      ),
    );
  }
}
