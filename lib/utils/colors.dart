
import 'package:flutter/cupertino.dart';

// custom colors
Color orangeColor = HexColor.fromHex("#FF7525");
Color greyTextColor = HexColor.fromHex("#CFCFCF");
Color passwordProgressColor = HexColor.fromHex("#FDC800");
Color deepOrange = HexColor.fromHex("#E94E1B");

Color heartBackgroundColor1 = HexColor.fromHex("#FDC800");
Color heartBackgroundColor2 = HexColor.fromHex("#FDC800");
Color heartBackgroundColor3 = HexColor.fromHex("#F39036");
Color heartBackgroundColor4 = HexColor.fromHex("#E94E1B");
Color heartBackgroundColor5 = HexColor.fromHex("#E94E1B");


extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}