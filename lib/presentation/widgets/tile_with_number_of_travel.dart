import 'package:flutter/material.dart';
import 'package:traveler/presentation/theme/constants.dart';

class TileWithNumberOfTravel extends StatelessWidget {
  const TileWithNumberOfTravel(
      {Key? key, required this.title, required this.travelCount})
      : super(key: key);

  final String title;
  final int travelCount;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: kWidgetColor.withOpacity(0.05),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(title, style: kTextStyleTitle),
            Text(
              "$travelCount",
              style: kTextStyleTitle.copyWith(fontSize: 48),
            ),
          ],
        ),
      ),
    );
  }
}
