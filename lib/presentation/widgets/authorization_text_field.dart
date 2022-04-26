import 'package:flutter/material.dart';
import 'package:traveler/presentation/theme/constants.dart';

class AuthorizationTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;

  const AuthorizationTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: kTextStyleTitle,
      cursorColor: kWidgetColor,
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: kTextStyleTitle,
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: kErrorColor, width: 2.0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide:
              BorderSide(color: kErrorColor.withOpacity(0.7), width: 2.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide:
              BorderSide(color: kWidgetColor.withOpacity(0.7), width: 2.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            width: 2,
            color: kWidgetColor,
          ),
        ),
        border: const OutlineInputBorder(),
      ),
      validator: (value) =>
          value != null && value.isNotEmpty ? null : 'Required',
    );
  }
}
