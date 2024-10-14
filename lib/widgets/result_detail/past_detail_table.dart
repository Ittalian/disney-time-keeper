import 'package:disney_time_keeper/models/past_detail.dart';
import 'package:disney_time_keeper/widgets/base/base_table_row.dart';
import 'package:flutter/material.dart';

class PastDetailTable extends StatelessWidget {
  final String label;
  final PastDetail pastDetail;

  const PastDetailTable(
      {super.key, required this.label, required this.pastDetail});

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
          child: Text(label,
              style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ),
        BaseTableRow(label: '平均待ち時間', value: pastDetail.averageWaitTime, leftWidth: 200, rightWidth: 80, height: 80),
        BaseTableRow(label: '過去最大待ち時間', value: pastDetail.maxWaitTime, leftWidth: 200, rightWidth: 80, height: 80),
      ],
    );
  }
}
