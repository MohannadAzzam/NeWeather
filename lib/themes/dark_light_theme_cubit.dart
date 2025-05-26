import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class DarkLightThemeCubit extends HydratedCubit<ThemeMode> {
  DarkLightThemeCubit() : super(ThemeMode.system);
  void updateTheme(ThemeMode newThemeMode) {
    emit(newThemeMode);
  }

  final String _jsonKey = 'themeMode';
  @override
  ThemeMode? fromJson(Map<String, dynamic> json) {
    final savedMode = json[_jsonKey];
    if (savedMode == 'light') {
      return ThemeMode.light;
    } else if (savedMode == 'dark') {
      return ThemeMode.dark;
    } else {
      return ThemeMode.system;
    }
  }

  @override
  Map<String, dynamic>? toJson(ThemeMode newMode) {
    if (newMode == ThemeMode.light) {
      return {_jsonKey: 'light'};
    } else if (newMode == ThemeMode.dark) {
      return {_jsonKey: 'dark'};
    } else {
      return {_jsonKey: 'system'};
    }
  }
}
