class WeatherModel {
  final String name;
  final String country;
  final double temp;
  final double minTemp;
  final double maxTemp;
  final String main;
  final String icon;

  WeatherModel({
    required this.name,
    required this.country,
    required this.temp,
    required this.minTemp,
    required this.maxTemp,
    required this.main,
    required this.icon,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      name: json['name'],
      country: json['sys']['country'],
      temp: json['main']['temp'] * 1.0,
      minTemp: json['main']['temp_min'] * 1.0,
      maxTemp: json['main']['temp_max'] * 1.0,
      main: json['weather'][0]['main'],
      icon: json['weather'][0]['icon'],
    );
  }
}
