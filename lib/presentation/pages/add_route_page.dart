import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traveler/presentation/theme/constants.dart';
import 'package:traveler/business_logic/blocs/add_route_bloc/add_route_bloc.dart';
import 'package:traveler/presentation/widgets/add_route_text_field.dart';
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
                      if (state.mapObjects?.length != 1) {
                        await controller.moveCamera(CameraUpdate.zoomTo(5),
                            animation: animation);
                      }
                      await controller.moveCamera(
                          CameraUpdate.newCameraPosition(
                              CameraPosition(target: state.point!, zoom: 10)),
                          animation: animation);
                    }
                  },
                  builder: (BuildContext context, state) {
                    return Column(
                      children: [
                        AddRouteTextField(
                          labelText: 'Выберете город',
                          onSubmitted: (value) {
                            if (value.isNotEmpty) {
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
                              mapObjects: state.mapObjects ?? [],
                              onMapCreated:
                                  (YandexMapController yandexMapController) {
                                controller = yandexMapController;
                              },
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        AddRouteTextField(
                          labelText: 'Добавьте достопримечательность',
                          onSubmitted: (value) {
                            if (value.isNotEmpty) {}
                          },
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
