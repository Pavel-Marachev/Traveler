import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traveler/business_logic/blocs/navigation_bloc/navigation_bloc.dart';
import 'package:traveler/firebase_options.dart';
import 'package:traveler/presentation/pages/add_route_page.dart';
import 'package:traveler/presentation/pages/authorization_page.dart';

import 'package:traveler/presentation/pages/home_page.dart';
import 'package:traveler/presentation/pages/places_list_page.dart';
import 'package:flutter_svg/svg.dart';
import 'package:traveler/presentation/theme/constants.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(BlocProvider(
      create: (context) => NavigationBloc()..add(AppStarted()),
      child: const MaterialApp(
        home: MyApp(),
        debugShowCheckedModeBanner: false,
      )));
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
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: kBackgroundWidgetColor,
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: kWidgetColor.withOpacity(0.6),
            selectedItemColor: kWidgetColor,
            backgroundColor: kMainColor.withOpacity(0.3),
            currentIndex: getCurrentIndex(state),
            onTap: (value) {
              switch (value) {
                case 0:
                  context.read<NavigationBloc>().add(PressedOnPlacesListPage());
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
                  color: kWidgetColor
                      .withOpacity(getCurrentIndex(state) == 0 ? 1 : 0.6),
                ),
                label: "Места",
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/images/home_icon.svg",
                  color: kWidgetColor
                      .withOpacity(getCurrentIndex(state) == 1 ? 1 : 0.6),
                ),
                label: "Главная",
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/images/travel_add_icon.svg",
                  color: kWidgetColor
                      .withOpacity(getCurrentIndex(state) == 2 ? 1 : 0.6),
                ),
                label: "Планирование",
              ),
            ],
          ),
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(0, 1),
                end: Alignment(1, 0.2),
                colors: <Color>[
                  kMainColor,
                  kBackgroundWidgetColor.withOpacity(0.9),
                ],
              ),
            ),
            child: getPageState(state),
          ),
        ),
      );
    });
  }
}
