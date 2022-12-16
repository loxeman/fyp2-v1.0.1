import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color gray600 = fromHex('#78746d');

  static Color gray700 = fromHex('#585a63');

  static Color gray400 = fromHex('#bebab3');

  static Color gray901 = fromHex('#1d1f27');

  static Color bluegray2005e = fromHex('#5eabb4bd');

  static Color red900 = fromHex('#79040b');

  static Color gray800 = fromHex('#363841');

  static Color gray900 = fromHex('#1e1f28');

  static Color bluegray100 = fromHex('#d9d9d9');

  static Color gray101 = fromHex('#f6f6f6');

  static Color black9000c = fromHex('#0c000000');

  static Color gray300 = fromHex('#dadada');

  static Color gray100 = fromHex('#f5f5f5');

  static Color bluegray900 = fromHex('#2a2b36');

  static Color indigoA700 = fromHex('#3553ef');

  static Color black900 = fromHex('#000000');

  static Color lightGreen800 = fromHex('#469b28');

  static Color bluegray200 = fromHex('#abb4bd');

  static Color black90014 = fromHex('#14000000');

  static Color whiteA700 = fromHex('#ffffff');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
