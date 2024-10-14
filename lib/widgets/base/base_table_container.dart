import 'package:flutter/material.dart';

class BaseTableContainer extends StatelessWidget {
  final String text;
  final Color backGroundColor;
  final double width;
  final Border border;

  const BaseTableContainer(
      {super.key,
      required this.text,
      required this.backGroundColor,
      required this.width,
      required this.border});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: backGroundColor.withOpacity(0.5), border: border),
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      width: width,
      alignment: Alignment.center,
      child: Text(text, style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}
