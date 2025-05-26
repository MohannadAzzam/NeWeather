import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubits/search/cubit/search_cubit.dart';
import 'cubits/weather/cubit/weather_cubit.dart';
import 'repositories/weather_repository.dart';
import 'routers/app_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'themes/dark_light_theme_cubit.dart';
import 'themes/theme_data/theme_data_dark.dart';
import 'themes/theme_data/theme_data_light.dart';

class FoodybiteApp extends StatelessWidget {
  final AppRouter appRouter;
  final weatherRepository = WeatherRepository();

  FoodybiteApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),

      minTextAdapt: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => SearchCubit(weatherRepository)),
          BlocProvider(create: (_) => DarkLightThemeCubit()),
          BlocProvider(
            create: (_) => WeatherCubit(weatherRepository: weatherRepository),
          ),
        ],
        child: BlocBuilder<DarkLightThemeCubit, ThemeMode>(
          builder: (context, newMode) {
            return MaterialApp(
              title: 'Neweather',
              darkTheme: getDarkThemeData(),
              theme: getLightThemeData(),
              debugShowCheckedModeBanner: false,
              onGenerateRoute: appRouter.generateRoute,
              themeMode: newMode,
            );
          },
        ),
      ),
    );
  }
}
