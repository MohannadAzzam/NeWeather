import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../repositories/weather_repository.dart';
import 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherCubit({required this.weatherRepository}) : super(WeatherInitial());

  Future<void> fetchWeatherByCoords(double lat, double lon) async {
    try {
      emit(WeatherLoading());
      final weather = await weatherRepository.getWeatherByCoords(lat, lon);
      emit(WeatherLoaded(weather: weather));
    } catch (e) {
      emit(WeatherError(message: e.toString()));
    }
  }
}
