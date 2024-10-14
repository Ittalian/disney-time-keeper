import 'package:disney_time_keeper/models/current_detail.dart';
import 'package:disney_time_keeper/models/past_detail.dart';
import 'package:disney_time_keeper/widgets/base/base_image_container.dart';
import 'package:disney_time_keeper/widgets/result_detail/current_detail_table.dart';
import 'package:disney_time_keeper/widgets/result_detail/past_detail_table.dart';
import 'package:flutter/material.dart';

class ResultDetail extends StatelessWidget {
  final CurrentDetail currentDetail;
  final PastDetail pastDetail;

  const ResultDetail({
    super.key,
    required this.currentDetail,
    required this.pastDetail,
  });

  @override
  Widget build(BuildContext context) {
    return BaseImageContainer(
        imagePath: 'images/result_detail.jpg',
        child: Scaffold(
          backgroundColor: Colors.white.withOpacity(0),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CurrentDetailTable(label: '現在の情報', currentDetail: currentDetail),
              const Padding(padding: EdgeInsets.only(top: 30)),
              PastDetailTable(label: '過去の情報', pastDetail: pastDetail),
            ],
          ),
        ));
  }
}
