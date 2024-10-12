import 'package:disney_time_keeper/models/attraction.dart';
import 'package:disney_time_keeper/pages/home/home.dart';
import 'package:disney_time_keeper/pages/result/result.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String home = 'home';
  static const String result = 'result';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const Home());
      case result:
        final resultOptions = settings.arguments as Map;
        return MaterialPageRoute(builder: (_) => Result(attractions: resultOptions['attractions'] as List<Attraction>));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text(
                      '${settings.name}は存在しません',
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                ));
    }
  }
}
