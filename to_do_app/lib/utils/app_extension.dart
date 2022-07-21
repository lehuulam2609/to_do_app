
import 'package:flutter/material.dart';

/// Get color from hex code
extension ColorExtension on String {
  toColor() {
    var hexColor = this?.replaceAll("#", "");
    if (hexColor != null) {
      if (hexColor.length == 6) {
        hexColor = "FF" + hexColor;
      }
      if (hexColor.length == 8) {
        return Color(int.parse("0x$hexColor"));
      }
    }
    return Colors.black;
  }
}