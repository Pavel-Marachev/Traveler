import 'package:flutter/material.dart';
import 'package:traveler/presentation/theme/constants.dart';

class AuthorizationButton extends StatelessWidget {
  final GestureTapCallback onTap;
  final bool isLoading;
  final String title;
  final Color color;
  final double opacity;

  const AuthorizationButton({
    Key? key,
    required this.onTap,
    required this.isLoading,
    required this.title,
    this.color = kBackgroundWidgetColor,
    this.opacity = 0.7,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: kWidgetColor.withOpacity(opacity),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: isLoading
              ? const CircularProgressIndicator(
                  color: kWidgetColor,
                  strokeWidth: 3,
                )
              : Text(
                  title,
                  style: kTextStyleTitle.copyWith(color: color),
                ),
        ),
      ),
    );
  }
}
