import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../models/weather_model.dart';
import '../../../repositories/weather_repository.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.weatherRepository) : super(SearchInitial());

  final WeatherRepository weatherRepository;
   Future<void> fetchWeatherByCity(String cityName) async {
    emit(SearchLoading());
    try {
      final weather = await weatherRepository.getWeatherByCity(cityName);
      emit(SearchSuccess(weather));
    } catch (e) {
      emit(SearchError('Could not fetch weather data'));
    }
  }
}
