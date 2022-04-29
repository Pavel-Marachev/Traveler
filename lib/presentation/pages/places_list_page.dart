import 'package:flutter/material.dart';
import 'package:traveler/business_logic/blocs/interesting_places_bloc/interesting_places_bloc.dart';
import 'package:traveler/presentation/theme/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlacesListPage extends StatefulWidget {
  const PlacesListPage({Key? key}) : super(key: key);

  @override
  State<PlacesListPage> createState() => _PlacesListPageState();
}

class _PlacesListPageState extends State<PlacesListPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => InterestingPlacesBloc()..add(Initialization()),
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
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            title: const Text(
              'Интересные места',
              style: kTextStyleTitle,
            ),
          ),
          backgroundColor: Colors.transparent,
          body: BlocBuilder<InterestingPlacesBloc, InterestingPlacesState>(
            builder: (BuildContext context, InterestingPlacesState state) {
              return state.isLoadingAllPlaces
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: kWidgetColor,
                      ),
                    )
                  : ListView.builder(
                      itemCount: state.places!.length,
                      itemBuilder: (BuildContext context, index) {
                        if (state.places![index].properties!.name!.isNotEmpty) {
                          return Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: kMainColor,
                              boxShadow: kMainShadow,
                            ),
                            child: ExpansionTile(
                              iconColor: kWidgetColor,
                              title: Text(
                                state.places![index].properties!.name!,
                                style: kTextStyleTitle,
                              ),
                              subtitle: Text(
                                'Рейтинг: ${state.places![index].properties!.rate!}',
                                style: kTextStyleTitle,
                              ),
                              onExpansionChanged: (isOpen) {
                                if (isOpen) {
                                  context.read<InterestingPlacesBloc>().add(
                                      TapOnInterestingPlace(state
                                          .places![index].properties!.xid!));
                                }
                              },
                              childrenPadding: const EdgeInsets.all(20),
                              children: state.isLoadingPlaceInformation
                                  ? [
                                      const CircularProgressIndicator(
                                        color: kWidgetColor,
                                      ),
                                    ]
                                  : [
                                      if (state.image != null)
                                        ClipRRect(
                                          child: Image.network(state.image!),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                      if (state.image != null)
                                        const SizedBox(height: 5),
                                      Text(
                                        state.text ?? 'Нет описания',
                                        style: kTextStyleFootnote.copyWith(
                                            color: kWidgetColor),
                                      ),
                                    ],
                            ),
                          );
                        } else {
                          return Container();
                        }
                      },
                    );
            },
          ),
        ),
      ),
    );
  }
}
