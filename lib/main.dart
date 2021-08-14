import 'package:flutter/material.dart';
import 'package:hangman_game/constants.dart';
import 'Screens/homePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hangman Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: kPrimeColor,
      ),
      home: Home(),
    );
  }
}
