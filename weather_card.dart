import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/models/weather.dart';

class WeatherCard extends StatelessWidget {
  final Weather weather;

  const WeatherCard({required this.weather});

  @override
  Widget build(BuildContext context) {
    final date = DateTime.fromMillisecondsSinceEpoch(weather.date * 1000);
    final formattedDate = DateFormat('MMM d, y').format(date);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${weather.cityName}, ${weather.countryCode}',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            formattedDate,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildWeatherInfo(
                icon: Icons.thermostat_outlined,
                label: 'Temperature',
                value: '${weather.temperature.toStringAsFixed(1)}°C',
              ),
              _buildWeatherInfo(
                icon: Icons.thermostat_rounded,
                label: 'Feels Like',
                value: '${weather.feelsLike.toStringAsFixed(1)}°C',
              ),
              _buildWeatherInfo(
                icon: Icons.opacity_outlined,
                label: 'Humidity',
                value: '${weather.humidity}%',
              ),
              _buildWeatherInfo(
                icon: Icons.air_outlined,
                label: 'Wind Speed',
                value: '${weather.windSpeed} m/s',
              ),
            ],
          ),
          SizedBox(height: 16),
          Text(
            weather.description,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWeatherInfo({required IconData icon, required String label, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon),
        SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(fontSize: 16),
        ),
        Text(
          value,
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
