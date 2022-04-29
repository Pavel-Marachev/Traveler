import 'package:flutter/material.dart';

const kBackgroundWidgetColor = Color(0xFF000000);
const kWidgetColor = Color(0xFFFFFFFF);
const kInactiveWidgetColor = Colors.grey;
const kMainColor = Colors.teal;
const kErrorColor = Color(0xFFF44336);

const TextStyle kTextStyleTitle = TextStyle(
  fontSize: 18,
  color: Color(0xFFFFFFFF),
);

const TextStyle kTextStyleFootnote = TextStyle(
  fontSize: 16,
  color: Colors.grey,
);

List<BoxShadow> kMainShadow = [
  BoxShadow(
    color: kBackgroundWidgetColor.withOpacity(0.2),
    spreadRadius: 2,
    blurRadius: 7,
    offset: Offset(0, 4),
  )
];
