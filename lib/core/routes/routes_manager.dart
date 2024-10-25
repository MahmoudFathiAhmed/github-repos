import 'package:github_repo/features/start/presentation/views/start_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String initialRoute = '/';
  static const String startRoute = '/startRoute';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    // final args = settings.arguments;
    switch (settings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (_) => const StartScreen());

      case Routes.startRoute:
        return MaterialPageRoute(builder: (_) => const StartScreen());

      default:
        return MaterialPageRoute(builder: (_) => const Scaffold());
    }
  }
}
