import 'package:flutter/material.dart';
import 'package:weather_app/screens/search_screen.dart';
import 'package:weather_app/screens/weather_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => WeatherScreen(),
        '/search': (context) => SearchScreen(),
      },
    );
  }
}
