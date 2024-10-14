import 'package:disney_time_keeper/config/router/routes.dart';
import 'package:disney_time_keeper/models/attraction.dart';
import 'package:disney_time_keeper/models/current_detail.dart';
import 'package:disney_time_keeper/models/past_detail.dart';
import 'package:disney_time_keeper/utils/loading/loading_dialog.dart';
import 'package:disney_time_keeper/widgets/base/base_text_button.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;
import '../../utils/constants/attraction_const.dart' as attraction_const;

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

  void renderResultDetail(BuildContext context) async {
    await LoadingDialog.show(context, '読み込み中');
    final target = Uri.parse(attraction_const.baseUrl + attraction.detailHref);
    final response = await http.get(target);
    final document = parse(response.body);
    List<String> waitTimeList = document
        .querySelectorAll('.info-data .info-data-value')
        .map((doc) => doc.text.trim())
        .toList();
    CurrentDetail currentDetail = CurrentDetail(
        currentWaitTime: waitTimeList[0],
        todayAverageWaitTime: waitTimeList[1],
        todayMaxWaitTime: waitTimeList[2]);
    PastDetail pastDetail = PastDetail(
        averageWaitTime: waitTimeList[3], maxWaitTime: waitTimeList[4]);
    await LoadingDialog.hide(context);
    moveResultDetail(context, currentDetail, pastDetail);
  }

  void moveResultDetail(BuildContext context, CurrentDetail currentDetail,
      PastDetail pastDetail) {
    Navigator.pushNamed(context, Routes.resultDetail, arguments: {
      'current_detail': currentDetail,
      'past_detail': pastDetail,
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
                textAlign: TextAlign.center),
            BaseTextButton(
                label: '詳細を見る', onPressed: () => renderResultDetail(context))
          ],
        ));
  }
}
