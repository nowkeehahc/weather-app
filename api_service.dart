import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:weather_app/models/weather.dart';

class ApiService {
  static const String _baseUrl = 'http://api.openweathermap.org/data/2.5/weather';
  static const String _apiKey = '3915e6715cf5624b8add62d31095a35b';

  Future<Weather> getWeather(String city) async {
    final response = await http.get(Uri.parse('$_baseUrl?q=$city&appid=$_apiKey&units=metric'));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final weather = Weather.fromJson(json);
      return weather;
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
