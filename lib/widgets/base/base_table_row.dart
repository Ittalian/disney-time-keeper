import 'package:disney_time_keeper/widgets/base/base_table_container.dart';
import 'package:flutter/material.dart';

class BaseTableRow extends StatelessWidget {
  final String label;
  final String value;

  const BaseTableRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BaseTableContainer(
            text: label,
            backGroundColor: Colors.white,
            width: 200,
            border: Border.all()),
        BaseTableContainer(
            text: value,
            backGroundColor: Colors.blue,
            width: 80,
            border: const Border(
              top: BorderSide(color: Colors.black),
              right: BorderSide(color: Colors.black),
              bottom: BorderSide(color: Colors.black),
            )),
      ],
    );
  }
}
