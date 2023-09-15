import 'package:flutter/material.dart';

Color TextColor(String x) {
  if (x == 'C' ||
      x == '%' ||
      x == 'Del' ||
      x == '/' ||
      x == '+' ||
      x == '*' ||
      x == '-' ||
      x == '=') {
    return Colors.white;
  } else {
    return Colors.black;
  }
}
