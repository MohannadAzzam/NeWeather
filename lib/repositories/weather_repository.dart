import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constants/constans.dart';
import '../models/weather_model.dart';

class WeatherRepository {
  final String apiKey = 'YOUR_API_KEY'; // Replace with your real API key

  Future<WeatherModel> getWeatherByCoords(double lat, double lon) async {
    final url = Uri.parse(
      '${MyConstats.myWeatherApi}?lat=$lat&lon=$lon&units=metric&appid=${MyConstats.weatherApiKey}',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return WeatherModel.fromJson(jsonData);
    } else {
      throw Exception('Failed to load weather data');
    }
  }

   Future<WeatherModel> getWeatherByCity(String cityName) async {
    final response = await http.get(
      Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=${MyConstats.weatherApiKey}&units=metric'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return WeatherModel.fromJson(data);
    } else {
      throw Exception('Error fetching weather data');
    }
  }
}
