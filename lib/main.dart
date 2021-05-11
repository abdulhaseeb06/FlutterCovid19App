import 'package:covid19_tracker_app/screens/main_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MainScreen(),
    theme: ThemeData(
      fontFamily: 'Montserrat',
      primarySwatch: Colors.orange,
    ),
  ));
}
