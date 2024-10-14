import 'package:disney_time_keeper/widgets/base/base_table_container.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BaseTableRow extends StatelessWidget {
  final String label;
  final String value;
  final double leftWidth;
  final double rightWidth;
  final String? url;
  final Color? textColor;

  const BaseTableRow(
      {super.key,
      required this.label,
      required this.value,
      required this.leftWidth,
      required this.rightWidth,
      this.url,
      this.textColor});

  void renderPublicSite(BuildContext context) async {
    final renderUrl = Uri.parse(url!);
    launchUrl(renderUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BaseTableContainer(
            text: label,
            backGroundColor: Colors.white,
            width: leftWidth,
            border: Border.all()),
        url == null
            ? BaseTableContainer(
                text: value,
                textColor: textColor,
                backGroundColor: const Color.fromARGB(255, 194, 227, 255),
                width: rightWidth,
                border: const Border(
                  top: BorderSide(color: Colors.black),
                  right: BorderSide(color: Colors.black),
                  bottom: BorderSide(color: Colors.black),
                ))
            : GestureDetector(
                onTap: () => renderPublicSite(context),
                child: BaseTableContainer(
                    text: value,
                    textColor: textColor,
                    backGroundColor: const Color.fromARGB(255, 194, 227, 255),
                    width: rightWidth,
                    border: const Border(
                      top: BorderSide(color: Colors.black),
                      right: BorderSide(color: Colors.black),
                      bottom: BorderSide(color: Colors.black),
                    ))),
      ],
    );
  }
}
