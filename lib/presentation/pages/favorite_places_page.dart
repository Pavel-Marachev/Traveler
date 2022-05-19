import 'package:flutter/material.dart';
import 'package:traveler/business_logic/blocs/interesting_places_bloc/interesting_places_bloc.dart';
import 'package:traveler/data/models/place_information_model.dart';
import 'package:traveler/presentation/theme/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traveler/presentation/widgets/dismissible_widget.dart';

class FavoritePlacesPage extends StatelessWidget {
  const FavoritePlacesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kBackgroundWidgetColor.withOpacity(0.8),
        title: const Text(
          'Избранные места',
          style: kTextStyleTitle,
        ),
      ),
      body: Container(
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
        child: BlocBuilder<InterestingPlacesBloc, InterestingPlacesState>(
          builder: (BuildContext context, InterestingPlacesState state) {
            return ListView.builder(
                itemCount: state.favoritePlaces?.length ?? 0,
                itemBuilder: (context, index) {
                  return DismissibleWidget(
                    image: state.foundPlaces
                        ?.firstWhere(
                            (element) =>
                                element.xid ==
                                state.favoritePlaces?[index].properties?.xid,
                            orElse: () => PlaceInformationModel())
                        .preview
                        ?.source,
                    direction: DismissDirection.endToStart,
                    rate: state.favoritePlaces![index].properties!.rate!,
                    placeName: state.favoritePlaces![index].properties!.name!,
                    dismissKey: state.favoritePlaces![index].properties!.xid!,
                    description: state.foundPlaces
                        ?.firstWhere(
                            (element) =>
                                element.xid ==
                                state.favoritePlaces?[index].properties?.xid,
                            orElse: () => PlaceInformationModel())
                        .wikipediaExtracts
                        ?.text,
                    isLoadingPlaceInformation: state.isLoadingPlaceInformation,
                    confirmDismiss: (DismissDirection direction) {
                      if (direction == DismissDirection.endToStart) {
                        context.read<InterestingPlacesBloc>().add(
                            DeletedFromFavorite(
                                state.favoritePlaces![index].properties!.xid!));
                        return true;
                      }
                    },
                    onExpansionChanged: (bool isOpen) {
                      if (isOpen) {
                        context.read<InterestingPlacesBloc>().add(
                            TapOnInterestingPlace(
                                state.favoritePlaces![index].properties!.xid!));
                      }
                    },
                  );
                });
          },
        ),
      ),
    );
  }
}
