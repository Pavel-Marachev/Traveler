import 'package:flutter/material.dart';
import 'package:traveler/presentation/theme/constants.dart';

class AddRoutePage extends StatelessWidget {
  const AddRoutePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        constraints: const BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: kBackgroundWidgetColor.withOpacity(0.9),
          borderRadius:
              const BorderRadius.vertical(bottom: Radius.circular(50)),
        ),
      ),
      //bottomNavigationBar: const MyTabBar(),
    );
  }
}
