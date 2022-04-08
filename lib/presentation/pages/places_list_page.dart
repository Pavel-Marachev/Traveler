import 'package:flutter/material.dart';
import 'package:traveler/presentation/theme/constants.dart';

class PlacesListPage extends StatefulWidget {
  const PlacesListPage({Key? key}) : super(key: key);

  @override
  State<PlacesListPage> createState() => _PlacesListPageState();
}

class _PlacesListPageState extends State<PlacesListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.5, 1),
            end: Alignment(0.5, -1),
            colors: <Color>[
              kMainColor,
              kBackgroundWidgetColor.withOpacity(0.9),
            ],
          ),
        ),
      ),
    );
  }
}
