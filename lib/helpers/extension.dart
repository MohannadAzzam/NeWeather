import 'package:flutter/material.dart';

extension Navigattion on BuildContext {
  Future<dynamic> pushNamed(String routeName, Map? arguments) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  // Future<dynamic> pushNamedAndRemoveUntil(String routeName, Map? arguments) {
  // return Navigator.of(this).pushNamedAndRemoveUntil(routeName , arguments: arguments);
  // }
}

extension ContextExt on BuildContext {
  bool get isDarkMode {
    return Theme.of(this).brightness == Brightness.dark;
  }
}
