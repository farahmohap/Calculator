import 'package:calculator/views/calc-view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CalcApp());
}

class CalcApp extends StatelessWidget {
  const CalcApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     // theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,home:CalcView(),);
  }
}