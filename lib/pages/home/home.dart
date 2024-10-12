import 'package:disney_time_keeper/config/router/routes.dart';
import 'package:disney_time_keeper/models/attraction.dart';
import 'package:disney_time_keeper/widgets/base/base_button.dart';
import 'package:disney_time_keeper/widgets/base/base_image_container.dart';
import 'package:disney_time_keeper/widgets/base/base_textform_field.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  String keyWord = '';

  void setKeyWord(String value) {
    setState(() {
      keyWord = value;
    });
  }

  Future<List<Attraction>> search(String url) async {
    List<Attraction> attractions = [];
    final target = Uri.parse(url);
    final response = await http.get(target);
    final document = parse(response.body);
    final nameList = document
        .querySelectorAll('a .realtime-attr-name')
        .map((name) => name.text.trim())
        .toList();
    final waitList = document
        .querySelectorAll('a .realtime-attr-condition')
        .map((element) => element.text.trim())
        .toList();
    for (var i = 0; i < nameList.length; i++) {
      final attraction = Attraction(name: nameList[i], waitTime: waitList[i]);
      attractions.add(attraction);
    }
    return attractions;
  }

  void moveResult(List<Attraction> attractions) {
    Navigator.pushNamed(context, Routes.result, arguments: {
      'attractions': attractions,
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseImageContainer(
        imagePath: 'images/home.jpg',
        child: Scaffold(
          backgroundColor: Colors.white.withOpacity(0),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BaseTextformField(
                  label: 'キーワード', setValue: (value) => setKeyWord(value)),
              BaseButton(
                  label: '検索',
                  onPressed: () async {
                    List<Attraction> attractions = await search(
                        'https://tokyodisneyresort.info/greeting_realtime.php?park=land&order=name');
                    moveResult(attractions);
                  })
            ],
          ),
        ));
  }
}
