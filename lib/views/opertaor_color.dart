import 'package:flutter/material.dart';

Color operatorBackground(String x) {
  if (x == '%' || x == '/' || x == '+' || x == '*' || x == '-') {
    return Color.fromARGB(255, 187, 69, 5);
  } else if (x == 'C' || x == 'Del' || x == '=') {
    return Colors.black;
  } else
    return Color.fromARGB(255, 210, 204, 204);
}
