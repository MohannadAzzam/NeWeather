// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:my_app/cubits/search/cubit/search_cubit.dart';
import 'package:my_app/cubits/weather/cubit/weather_cubit.dart';
import 'package:my_app/cubits/weather/cubit/weather_state.dart';
import 'package:my_app/helpers/extension.dart';
import 'package:my_app/routers/routers.dart';
import 'package:my_app/widgets/weather.dart';

class WhetherScreen extends StatefulWidget {
  const WhetherScreen({super.key});

  @override
  State<WhetherScreen> createState() => _WhetherScreenState();
}

class _WhetherScreenState extends State<WhetherScreen> {
  String locationMessage = "Press the button to get location";

  Future<Position> getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() {
        locationMessage = "Location services are disabled.";
      });
      throw Exception("Location services are disabled.");
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() {
          locationMessage = "Location permissions are denied";
        });
        throw Exception("Location permissions are denied.");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      setState(() {
        locationMessage = "Location permissions are permanently denied.";
      });
      throw Exception("Location permissions are permanently denied.");
    }

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    setState(() {
      locationMessage =
          "Latitude: ${position.latitude}, Longitude: ${position.longitude}";
    });

    return position;
  }

  @override
  void initState() {
    super.initState();
    fetchWeatherByLocation();
  }

  void fetchWeatherByLocation() async {
    try {
      Position position = await getLocation();
      double lat = position.latitude;
      double lon = position.longitude;
      // ignore: use_build_context_synchronously
      context.read<WeatherCubit>().fetchWeatherByCoords(lat, lon);
    } catch (e) {
      // print("Location error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather"),
        actions: [
          IconButton(
  onPressed: () {
    final searchCubit = context.read<SearchCubit>();

    // Defer showSearch to avoid navigator being locked
    // WidgetsBinding.instance.addPostFrameCallback((_) {
      showSearch(
        context: context,
        delegate: CustomSearchDelegate(searchCubit),
      );
    // }
    // );
  },
  icon: Icon(Icons.search),
),
        ],
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is WeatherError) {
            return Center(child: Text("Error: ${state.message}"));
          } else if (state is WeatherLoaded) {
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
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  final SearchCubit searchCubit;
  CustomSearchDelegate(this.searchCubit);

  @override
  String? get searchFieldLabel => 'Search City';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      if (query.isNotEmpty)
        IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
            showSuggestions(context);
          },
        ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return BackButton(onPressed: () => close(context, null));
  }

  @override
  Widget buildResults(BuildContext context) {
    // searchCubit.fetchWeatherByCity(query);

    close(context, null);
Future.delayed(Duration.zero, () {
      context.pushNamed(Routers.selectedWeather, {'cityName': query});

});
    return Container();
    // return BlocBuilder<SearchCubit, SearchState>(
    //   bloc: searchCubit,
    //   builder: (context, state) {
    //     if (state is SearchLoading) {
    //       return Center(child: CircularProgressIndicator());
    //     } else if (state is SearchSuccess) {
    //       final weather = state.weather;
    //       return Weather(
    //         name: weather.name,
    //         code: weather.country,
    //         temp: weather.temp,
    //         icon: weather.icon,
    //         main: weather.main,
    //         minTemp: weather.minTemp,
    //         maxTemp: weather.maxTemp,
    //       );
    //     } else if (state is WeatherError) {
    //       return Center(child: Text('Somthing wrong occured'));
    //     }
    //     return Center(child: Text('Enter a city name'));
    //   },
    // );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(); // Optional: Implement suggestions if needed
  }
}
