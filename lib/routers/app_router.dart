import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/navigation/navigation_cubit.dart';
import 'routers.dart';
import '../screens/home_screen.dart';
import '../screens/news_details_screen.dart';
import '../screens/selected_city_weather.dart';
import '../screens/settings_screen.dart';
import '../screens/whether_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routers.homeScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider<NavigationCubit>(
                create: (_) => NavigationCubit(),
                child: HomeScreen(),
              ),
        );

      case Routers.newsScreen:
        return MaterialPageRoute(
          builder:
              (_) =>
                  //  BlocProvider<NewsCubit>(
                  //   create: (_) => NewsCubit(),
                  //   child: Builder(builder: (context) => BlocProvider(create: (_) => DarkLightThemeCubit(),
                  //   child:
                  SettingsScreen(),
          //    )
          //    ),
          // ),
        );

      case Routers.whetherScreen:
        return MaterialPageRoute(builder: (_) => WhetherScreen());
      case Routers.selectedWeather:
        final args = settings.arguments as Map<dynamic, dynamic>;
        return MaterialPageRoute(
          builder: (_) => SelectedCityWeather(cityName: args['cityName']),
        );
      case Routers.settingsScreen:
        return MaterialPageRoute(builder: (_) => SettingsScreen());
      case Routers.newsDetails:
        final args = settings.arguments as Map<dynamic, dynamic>;
        return MaterialPageRoute(
          builder:
              (_) => NewsDetails(
                author: args['author'] ?? '',
                description: args['description'] ?? '',
                title: args['title'] ?? '',
                urlToImage: args['urlToImage'] ?? '',
              ),
        );

      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                body: Center(child: Text("No Route ${settings.name}")),
              ),
        );
    }
  }
}
