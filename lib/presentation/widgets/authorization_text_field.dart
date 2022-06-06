import 'package:flutter/material.dart';
import 'package:traveler/presentation/theme/constants.dart';

class AuthorizationTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final double borderRadius;
  final void Function(String value)? onSubmitted;

  const AuthorizationTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    this.onSubmitted,
    this.borderRadius = 30,
  }) : super(key: key);

  String? validateEmail(String? value) {
    if (hintText == 'Email') {
      value != null && value.isNotEmpty ? null : 'Required';
      String pattern =
          r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
          r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
          r"{0,253}[a-zA-Z0-9])?)*$";
      RegExp regex = RegExp(pattern);
      if (value == null || value.isEmpty || !regex.hasMatch(value))
        return 'Enter a valid email address';
      else
        return null;
    } else {
      return value != null && value.isNotEmpty ? null : 'Required';
    }
  }

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
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(color: kErrorColor, width: 2.0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide:
              BorderSide(color: kErrorColor.withOpacity(0.7), width: 2.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide:
              BorderSide(color: kWidgetColor.withOpacity(0.7), width: 2.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(
            width: 2,
            color: kWidgetColor,
          ),
        ),
        border: const OutlineInputBorder(),
      ),
      validator: (value) => validateEmail(value),
      onFieldSubmitted: (value) => onSubmitted!(value),
    );
  }
}
