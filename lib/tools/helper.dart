import 'dart:math';

import 'package:flutter/material.dart';

MaterialColor colorToMaterialColor(Color color) {
  List<double> strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}

Color hexToColor(String hexColorCode) {
  if (hexColorCode.startsWith('#')) {
    hexColorCode = hexColorCode.substring(1);
  }

  if (hexColorCode.length != 6 && hexColorCode.length != 8) {
    throw ArgumentError('Invalid HEX color code format');
  }

  if (hexColorCode.length == 6) {
    hexColorCode = 'FF$hexColorCode';
  }

  return Color(int.parse('0x$hexColorCode'));
}

Color randomColor() {
  Random random = Random();
  return Color.fromRGBO(
    random.nextInt(256),
    random.nextInt(256),
    random.nextInt(256),
    1,
  );
}
