import 'package:flutter/material.dart';

class ColorManager {
  static Color primary = HexColor.fromHex('#ED9728');
  static Color priamry70 = HexColor.fromHex('#B3ED9728');
  static Color darkGrey = HexColor.fromHex('#525252');
  static Color grey = HexColor.fromHex('#737477');
  static Color lightGrey = HexColor.fromHex('#9E9E9E');
}

extension HexColor on Color {
  static Color fromHex(String hexValue) {
    final sanitizedHexValue = hexValue.replaceAll('#', '');

    if (sanitizedHexValue.length == 6) {
      final hexValueOpacity = 'FF$sanitizedHexValue'; // 100% opacity
      return Color(int.parse(hexValueOpacity, radix: 16));
    }

    return Color(int.parse(sanitizedHexValue, radix: 16));
  }
}
