import 'dart:convert';
import 'dart:io';

import 'package:http/io_client.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../constants/constans.dart';
import 'package:my_app/cubits/news/cubit/news_state.dart'; // Assuming you're using BLoC


class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());


Future<void> fetchNews() async {
  emit(NewsLoading());

  try {
    // Create an HttpClient that accepts bad certificates
    HttpClient httpClient = HttpClient()
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;

    // Wrap in an IOClient so it can be used like the http package
    IOClient ioClient = IOClient(httpClient);

    final response = await ioClient.get(Uri.parse(MyConstats.myNewsApi));

    if (response.statusCode == 200) {
      final Map<String, dynamic> news = json.decode(response.body);
      emit(NewsLoaded(news));
    } else {
      emit(NewsError(message: "HTTP error: ${response.statusCode}"));
    }
  } catch (e) {
    emit(NewsError(message: "The error is $e"));
  }
}

}
