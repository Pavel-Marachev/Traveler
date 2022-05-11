import 'package:flutter/material.dart';
import 'package:traveler/presentation/theme/constants.dart';

class AddRouteTextField extends StatelessWidget {
  final Function(String)? onSubmitted;
  final String labelText;

  const AddRouteTextField({
    Key? key,
    required this.onSubmitted,
    required this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: kTextStyleTitle.copyWith(fontSize: 16),
      decoration: InputDecoration(
        labelStyle: kTextStyleTitle.copyWith(fontSize: 16),
        labelText: labelText,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: kWidgetColor,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: kWidgetColor,
            width: 2,
          ),
        ),
      ),
      onSubmitted: (value) => onSubmitted!(value),
    );
  }
}
