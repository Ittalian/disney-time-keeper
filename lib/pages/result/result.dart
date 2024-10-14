import 'package:disney_time_keeper/models/attraction.dart';
import 'package:disney_time_keeper/widgets/base/base_image_container.dart';
import 'package:disney_time_keeper/widgets/result/result_tile.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final List<Attraction> attractions;
  final int category;

  const Result({super.key, required this.attractions, required this.category});

  @override
  Widget build(BuildContext context) {
    return BaseImageContainer(
        imagePath: 'images/result.jpg',
        child: Scaffold(
            backgroundColor: Colors.white.withOpacity(0),
            body: Container(
                alignment: Alignment.center,
                child: SingleChildScrollView(
                    child: Column(children: [
                  for (var attraction in attractions)
                    ResultTile(attraction: attraction, category: category)
                ])))));
  }
}
