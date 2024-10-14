import 'package:disney_time_keeper/models/attraction.dart';
import 'package:disney_time_keeper/widgets/result/result_tile.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final List<Attraction> attractions;

  const Result({super.key, required this.attractions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(children: [
      for (var attraction in attractions) ResultTile(attraction: attraction)
    ]))));
  }
}
