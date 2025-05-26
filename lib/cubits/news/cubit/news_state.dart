
sealed class NewsState {}

final class NewsInitial extends NewsState {}


final class NewsLoading extends NewsState {}

final class NewsLoaded extends NewsState {
  final Map<String,dynamic> news;
  NewsLoaded(this.news);
}

final class NewsError extends NewsState {
  final String message;

  NewsError({required this.message});
}

