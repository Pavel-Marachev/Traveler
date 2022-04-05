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
      appBar: AppBar(
        title: Text('Маршруты'),
        backgroundColor: kBackgroundWidgetColor.withOpacity(0.9),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
