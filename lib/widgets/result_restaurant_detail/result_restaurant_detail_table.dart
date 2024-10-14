import 'package:disney_time_keeper/models/restaurant.dart';
import 'package:disney_time_keeper/widgets/base/base_table_row.dart';
import 'package:flutter/material.dart';

class ResultRestaurantDetailTable extends StatelessWidget {
  final Restaurant restaurant;

  const ResultRestaurantDetailTable({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BaseTableRow(
            label: '座席数',
            value: restaurant.seats,
            leftWidth: 130,
            rightWidth: 270),
        BaseTableRow(
            label: '場所',
            value: restaurant.place,
            leftWidth: 130,
            rightWidth: 270),
        BaseTableRow(
            label: 'サービスタイプ',
            value: restaurant.serviceType,
            leftWidth: 130,
            rightWidth: 270),
        BaseTableRow(
            label: '公式URL',
            value: restaurant.publicUrl,
            leftWidth: 130,
            rightWidth: 270,
            url: restaurant.url,
            textColor: const Color.fromARGB(255, 0, 102, 255)),
        BaseTableRow(
            label: 'キーワード',
            value: restaurant.keyWord,
            leftWidth: 130,
            rightWidth: 270),
      ],
    );
  }
}
