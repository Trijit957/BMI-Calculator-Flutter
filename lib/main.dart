import 'package:flutter/material.dart';
import 'package:bmi_calculator/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      theme: ThemeData.dark(),
      home: const HomeScreen(title: 'BMI Calculator'),
    );
  }
}
