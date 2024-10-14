import 'package:flutter/material.dart';

class BaseTableContainer extends StatelessWidget {
  final String text;
  final Color backGroundColor;
  final double width;
  final Border border;
  final Color? textColor;

  const BaseTableContainer(
      {super.key,
      required this.text,
      required this.backGroundColor,
      required this.width,
      required this.border,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: backGroundColor.withOpacity(0.8), border: border),
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      height: 80,
      width: width,
      alignment: Alignment.center,
      child: Text(text,
      textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: textColor)),
    );
  }
}
