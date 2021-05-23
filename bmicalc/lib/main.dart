import 'package:flutter/material.dart';
import 'widgets/reusable_card.dart';
import 'screens/input_screen.dart';
import 'screens/result_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      title: 'BMI',
      routes: {
        '/': (context) => InputScreen(),
        '/result': (context) => ResultsPage(),
      },
    );
  }
}
