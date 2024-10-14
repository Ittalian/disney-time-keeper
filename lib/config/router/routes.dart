import 'package:disney_time_keeper/models/attraction.dart';
import 'package:disney_time_keeper/models/current_detail.dart';
import 'package:disney_time_keeper/models/past_detail.dart';
import 'package:disney_time_keeper/models/restaurant.dart';
import 'package:disney_time_keeper/pages/home/home.dart';
import 'package:disney_time_keeper/pages/result/result.dart';
import 'package:disney_time_keeper/pages/result_detail/result_detail.dart';
import 'package:disney_time_keeper/pages/result_restaurant_detail/result_restaurant_detail.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String home = 'home';
  static const String result = 'result';
  static const String resultDetail = 'result_detail';
  static const String resultRestaurantDetail = 'result_restaurant_detail';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const Home());
      case result:
        final resultOptions = settings.arguments as Map;
        return MaterialPageRoute(
            builder: (_) => Result(
                attractions: resultOptions['attractions'] as List<Attraction>,
                category: resultOptions['category'] as int));
      case resultDetail:
        final resultDetailOptions = settings.arguments as Map;
        return MaterialPageRoute(
            builder: (_) => ResultDetail(
                currentDetail:
                    resultDetailOptions['current_detail'] as CurrentDetail,
                pastDetail: resultDetailOptions['past_detail'] as PastDetail));
      case resultRestaurantDetail:
        final resultRestaurantOptions = settings.arguments as Map;
        return MaterialPageRoute(
            builder: (_) => ResultRestaurantDetail(
                restaurant:
                    resultRestaurantOptions['restaurant'] as Restaurant));
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
