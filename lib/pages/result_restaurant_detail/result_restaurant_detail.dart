import 'package:disney_time_keeper/models/restaurant.dart';
import 'package:disney_time_keeper/widgets/base/base_image_container.dart';
import 'package:disney_time_keeper/widgets/result_restaurant_detail/result_restaurant_detail_table.dart';
import 'package:flutter/material.dart';

class ResultRestaurantDetail extends StatelessWidget {
  final Restaurant restaurant;

  const ResultRestaurantDetail({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return BaseImageContainer(
        imagePath: 'images/result_restaurant_detail.jpg',
        child: Scaffold(
          backgroundColor: Colors.white.withOpacity(0),
          body: ResultRestaurantDetailTable(restaurant: restaurant),
        ));
  }
}
