import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traveler/business_logic/blocs/navigation_bloc/navigation_bloc.dart';
import 'package:traveler/presentation/pages/add_route_page.dart';

import 'package:traveler/presentation/pages/home_page.dart';
import 'package:traveler/presentation/pages/places_list_page.dart';
import 'package:flutter_svg/svg.dart';
import 'package:traveler/presentation/theme/constants.dart';

void main() {
  runApp(BlocProvider(
      create: (context) => NavigationBloc()..add(AppStarted()),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  Widget getPageState(NavigationState state) {
    if (state is StateHomePage) {
      return const HomePage();
    } else if (state is StateAddRoutePage) {
      return const AddRoutePage();
    } else {
      return const PlacesListPage();
    }
  }

  int getCurrentIndex(NavigationState state) {
    if (state is StateHomePage) {
      return 1;
    } else if (state is StateAddRoutePage) {
      return 2;
    } else {
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
      return MaterialApp(
        title: 'Traveler',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          bottomNavigationBar: Container(
            margin: const EdgeInsets.all(15),
            height: 60,
            decoration: BoxDecoration(
              color: kBackgroundWidgetColor.withOpacity(0.9),
              borderRadius: BorderRadius.circular(30),
            ),
            child: BottomNavigationBar(
              unselectedItemColor: kWidgetColor,
              selectedItemColor: kWidgetColor,
              backgroundColor: Colors.transparent,
              currentIndex: getCurrentIndex(state),
              onTap: (value) {
                switch (value) {
                  case 0:
                    context
                        .read<NavigationBloc>()
                        .add(PressedOnPlacesListPage());
                    break;
                  case 1:
                    context.read<NavigationBloc>().add(PressedOnHomePage());
                    break;
                  case 2:
                    context.read<NavigationBloc>().add(PressedOnAddRoutePage());
                    break;
                }
              },
              items: [
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    "assets/images/list_icon.svg",
                  ),
                  label: "Маршруты",
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    "assets/images/home_icon.svg",
                  ),
                  label: "Главная",
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    "assets/images/travel_add_icon.svg",
                  ),
                  label: "Планирование",
                ),
              ],
            ),
          ),
          body: getPageState(state),
        ),
      );
    });
  }
}
