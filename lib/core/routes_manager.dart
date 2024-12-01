import 'package:flutter/material.dart';
import 'package:news_app_c12_online_sat/presentation/screens/home/home.dart';
import 'package:news_app_c12_online_sat/presentation/screens/splash/splash.dart';

class RoutesManager {
  static const String splash = '/splash';
  static const String home = '/home';

  static Route? router(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(
          builder: (context) => const Splash(),
        );
      case home:
        return MaterialPageRoute(
          builder: (context) => const Home(),
        );
    }
  }
}
