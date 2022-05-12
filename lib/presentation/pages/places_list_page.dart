import 'package:flutter/material.dart';
import 'package:traveler/business_logic/blocs/interesting_places_bloc/interesting_places_bloc.dart';
import 'package:traveler/presentation/theme/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traveler/presentation/widgets/authorization_text_field.dart';

class PlacesListPage extends StatefulWidget {
  const PlacesListPage({Key? key}) : super(key: key);

  @override
  State<PlacesListPage> createState() => _PlacesListPageState();
}

class _PlacesListPageState extends State<PlacesListPage> {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => InterestingPlacesBloc()..add(Initialization('Москва')),
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
          body: BlocBuilder<InterestingPlacesBloc, InterestingPlacesState>(
            builder: (BuildContext context, InterestingPlacesState state) {
              return CustomScrollView(
                slivers: [
                  SliverAppBar(
                    title: const Text(
                      'Интересные места',
                      style: kTextStyleTitle,
                    ),
                    centerTitle: true,
                    backgroundColor: kBackgroundWidgetColor.withOpacity(0.8),
                    pinned: true,
                    expandedHeight: 150,
                    flexibleSpace: SafeArea(
                      child: FlexibleSpaceBar(
                        background: Padding(
                          padding: const EdgeInsets.only(
                              bottom: 10, left: 10, right: 10, top: 70),
                          child: AuthorizationTextField(
                            hintText: 'город для поиска',
                            obscureText: false,
                            controller: textEditingController,
                            onSubmitted: (value) {
                              context
                                  .read<InterestingPlacesBloc>()
                                  .add(Initialization(value));
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  state.isLoadingAllPlaces
                      ? const SliverToBoxAdapter(
                          child: Padding(
                            padding: EdgeInsets.only(top: 100),
                            child: Center(
                              child: CircularProgressIndicator(
                                color: kWidgetColor,
                              ),
                            ),
                          ),
                        )
                      : SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              if (state.places![index].properties!.name!
                                  .isNotEmpty) {
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
                                        context
                                            .read<InterestingPlacesBloc>()
                                            .add(TapOnInterestingPlace(state
                                                .places![index]
                                                .properties!
                                                .xid!));
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
                                                child:
                                                    Image.network(state.image!),
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                            if (state.image != null)
                                              const SizedBox(height: 5),
                                            Text(
                                              state.text ?? 'Нет описания',
                                              style:
                                                  kTextStyleFootnote.copyWith(
                                                      color: kWidgetColor),
                                            ),
                                          ],
                                  ),
                                );
                              } else {
                                return Container();
                              }
                            },
                            childCount: state.places!.length,
                          ),
                        ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
