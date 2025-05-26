import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/search/cubit/search_cubit.dart';
import '../cubits/weather/cubit/weather_state.dart';
import '../repositories/weather_repository.dart';

import '../widgets/weather.dart';

class SelectedCityWeather extends StatelessWidget {
  final String cityName;
  const SelectedCityWeather({super.key, required this.cityName});

  @override
  Widget build(BuildContext context) {
    var weatherRepository = WeatherRepository();
    var searchCubit = SearchCubit(weatherRepository);
    searchCubit.fetchWeatherByCity(cityName);

    return Scaffold(
      appBar: AppBar(title: Text('$cityName weather')),
      body: BlocBuilder<SearchCubit, SearchState>(
        bloc: searchCubit,
        builder: (context, state) {
          if (state is SearchLoading) {
            context.read<SearchCubit>().fetchWeatherByCity(cityName);
            return Center(child: CircularProgressIndicator());
          } else if (state is SearchSuccess) {
            final weather = state.weather;
            return Weather(
              name: weather.name,
              code: weather.country,
              temp: weather.temp,
              icon: weather.icon,
              main: weather.main,
              minTemp: weather.minTemp,
              maxTemp: weather.maxTemp,
            );
          } else if (state is WeatherError) {
            return Center(child: Text('Somthing wrong occured'));
          }
          return Center(child: Text('City name is incorrect'));
        },
      ),
    );
  }
}
