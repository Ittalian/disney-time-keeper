import 'package:disney_time_keeper/models/current_detail.dart';
import 'package:disney_time_keeper/widgets/base/base_table_row.dart';
import 'package:flutter/material.dart';

class CurrentDetailTable extends StatelessWidget {
  final String label;
  final CurrentDetail currentDetail;

  const CurrentDetailTable(
      {super.key, required this.label, required this.currentDetail});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5),
                border: const Border(
                  top: BorderSide(color: Colors.black),
                  left: BorderSide(color: Colors.black),
                  right: BorderSide(color: Colors.black),
                )),
            padding: const EdgeInsets.all(5),
            child: Text(
              label,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
        BaseTableRow(label: '現在の待ち時間', value: currentDetail.currentWaitTime),
        BaseTableRow(
            label: '本日の平均待ち時間', value: currentDetail.todayAverageWaitTime),
        BaseTableRow(label: '本日の最大待ち時間', value: currentDetail.todayMaxWaitTime),
      ],
    );
  }
}
