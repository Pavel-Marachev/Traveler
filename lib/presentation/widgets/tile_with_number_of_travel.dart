import 'package:flutter/material.dart';

class TileWithNumberOfTravel extends StatelessWidget {
  const TileWithNumberOfTravel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}