part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchSuccess extends SearchState {
  final WeatherModel weather;
  SearchSuccess(this.weather);
}

class SearchError extends SearchState {
  final String message;
  SearchError(this.message);
}
