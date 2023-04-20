import 'package:flutter/material.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/screens/home_screen.dart';
import 'package:weather_app/screens/weather_screen.dart';
import 'package:weather_app/services/weather_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primaryColor: Colors.white,
        fontFamily: 'Montserrat',
      ),
      home: HomeScreen(),
    );
  }
}
