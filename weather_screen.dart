import 'package:flutter/material.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/screens/components/search_bar.dart';
import 'package:weather_app/screens/components/weather_card.dart';
import 'package:weather_app/screens/components/weather_error.dart';
import 'package:weather_app/screens/components/weather_loading.dart';
import 'package:weather_app/services/weather_service.dart';

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  Weather? weather;
  String? error;

  Future<void> _fetchWeather(String cityName) async {
    setState(() {
      weather = null;
      error = null;
    });

    try {
      final response = await WeatherService.getWeather(cityName);
      setState(() {
        weather = response;
      });
    } catch (e) {
      setState(() {
        error = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SearchBar(
              onSubmitted: _fetchWeather,
            ),
            SizedBox(height: 16),
            Expanded(
              child: _buildBody(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBody() {
    if (weather != null) {
      return WeatherCard(weather: weather!);
    } else if (error != null) {
      return WeatherError(message: error!);
    } else {
      return WeatherLoading();
    }
  }
}
