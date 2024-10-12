import 'package:disney_time_keeper/models/attraction.dart';
import 'package:flutter/material.dart';

class ResultTile extends StatelessWidget {
  final Attraction attraction;

  const ResultTile({super.key, required this.attraction});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white.withOpacity(0.5),
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text(attraction.name), Text(attraction.waitTime)],
        ));
  }
}
