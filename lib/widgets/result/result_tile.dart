import 'package:disney_time_keeper/models/attraction.dart';
import 'package:flutter/material.dart';

class ResultTile extends StatelessWidget {
  final Attraction attraction;

  const ResultTile({super.key, required this.attraction});

  String formatWaitTime(String waitTime) {
    String trimmedWaitTime = waitTime.replaceAll(RegExp(r'\s'), '');
    return trimmedWaitTime.replaceFirstMapped(
        RegExp(r'(\S)(\(?\d{1,2}:\d{2}-\d{1,2}:\d{2}\)?)'), (Match match) {
      return '${match.group(1)}\n${match.group(2)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white.withOpacity(0.5),
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Text(attraction.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
            Text(formatWaitTime(attraction.waitTime),
                textAlign: TextAlign.center)
          ],
        ));
  }
}
