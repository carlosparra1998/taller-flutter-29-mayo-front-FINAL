import 'package:flutter/material.dart';

List<String> colorKeys = ['blue', 'red', 'green']; 

Color? getColorFromKey(String? colorKey) {
  switch (colorKey) {
    case 'blue':
      return Colors.blue;
    case 'red':
      return Colors.red;
    case 'green':
      return Colors.green;
    default:
      return null;
  }
}
