import 'package:flutter/material.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/services/weather_service.dart';
import 'package:weather_app/widgets/weather_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final cityController = TextEditingController();
  Weather? weather;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: cityController,
                decoration: InputDecoration(
                  hintText: 'Enter a city name',
                  border: OutlineInputBorder(),
                ),
                onSubmitted: (value) async {
                  final newWeather = await WeatherService.getWeather(value);
                  setState(() {
                    weather = newWeather;
                  });
                },
              ),
              SizedBox(height: 20),
              if (weather != null)
                WeatherCard(weather: weather!)
              else
                Text('Enter a city name to see the weather'),
            ],
          ),
        ),
      ),
    );
  }
}
