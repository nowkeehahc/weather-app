class Weather {
  final int date;
  final String cityName;
  final String countryCode;
  final String description;
  final double temperature;
  final double feelsLike;
  final int humidity;
  final double windSpeed;

  Weather({
    required this.date,
    required this.cityName,
    required this.countryCode,
    required this.description,
    required this.temperature,
    required this.feelsLike,
    required this.humidity,
    required this.windSpeed,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      date: json['dt'] as int,
      cityName: json['name'] as String,
      countryCode: json['sys']['country'] as String,
      description: json['weather'][0]['description'] as String,
      temperature: json['main']['temp'] as double,
      feelsLike: json['main']['feels_like'] as double,
      humidity: json['main']['humidity'] as int,
      windSpeed: json['wind']['speed'] as double,
    );
  }
}
