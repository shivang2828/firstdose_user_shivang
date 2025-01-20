import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';

class ColorStyle {
  static final themeColor = hex('#f67570');
  static final scaffoldbgcolor = hex('#F9F9FA');
  static final resendcodetextColor = hex('#FB5650');
  static final lightintroScreenBgcolor = hex('#fededc');
  static final blue5EABEA = hex('#5EABEA');
  static final whitecolor = hex('#ffffff');
  static final green20AF0B = hex('#20AF0B');
  static final blue35856C = hex('#35856C');
  static final redFF3B2D = hex('#FF3B2D');
  static final blackcolor = hex('#000000');
  static final greycolor = hex('#777777');
  static final grey595C69 = hex('#595C69');
  static final lightgreycolor = hex('#666666');
  static final grey565C69 = hex('#565C69');
  static final extralightgreycolor = hex('#f1f1f1');
  static final bordercolor = hex('#333333');
  static final searchvartextcolor = hex('#B5B5B5');
  static final greyDDDD = hex('#DDDDDD');
  static final lightthemencolor = hex('#FFF1F1');
  static final searchbarcolor = hex('#F4F5F8');
  static final green008000 = hex('#008000');
  static final grey7E8494 = hex('#7E8494');
  static final yellowFFC22E = hex('#FFC22E');
  static final greyD9D9D9 = hex('#D9D9D9');
  static final black2C2C2C = hex('#2C2C2C');

  static final boxShadowColor25 = Color.fromRGBO(0, 0, 0, 0.25);

  static Color hex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}

extension ColorConversion on Color {
  MaterialColor toMaterialColor() {
    final List strengths = <double>[.05];
    final Map<int, Color> swatch = {};
    final r = red, g = green, b = blue;

    for (var i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }

    for (final strength in strengths) {
      final ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }

    return MaterialColor(value, swatch);
  }
}
