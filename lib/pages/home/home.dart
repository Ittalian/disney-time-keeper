import 'package:disney_time_keeper/config/router/routes.dart';
import 'package:disney_time_keeper/models/attraction.dart';
import 'package:disney_time_keeper/widgets/base/base_button.dart';
import 'package:disney_time_keeper/widgets/base/base_image_container.dart';
import 'package:disney_time_keeper/widgets/base/base_select.dart';
import 'package:disney_time_keeper/widgets/base/base_textform_field.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;
import 'package:disney_time_keeper/utils/constants/attraction_const.dart'
    as attraction_const;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  String keyWord = '';
  String park = '';
  int category = 0;

  void setKeyWord(String value) {
    setState(() {
      keyWord = value;
    });
  }

  void setPark(String value) {
    setState(() {
      park = value;
    });
  }

  void setCaterogy(String value) {
    setState(() {
      category = int.parse(value);
    });
  }

  String getUrl() {
    switch (category) {
      case 1:
        return attraction_const.attractionUrl + park;
      case 2:
        return attraction_const.greetingUrl + park;
      case 3:
        return attraction_const.restaurantUrl + park;
      default:
        return '';
    }
  }

  bool filterByKeyWord(String name) {
    if (name.toLowerCase().contains(keyWord.toLowerCase())) {
      return true;
    }
    return false;
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
    final hrefList = document
        .querySelectorAll('.realtime-attr a')
        .map((tag) => tag.attributes['href'].toString())
        .toList();
    for (var i = 0; i < nameList.length; i++) {
      if (filterByKeyWord(nameList[i])) {
        final attraction = Attraction(
            name: nameList[i], waitTime: waitList[i], detailHref: hrefList[i]);
        attractions.add(attraction);
      }
    }
    if (attractions.isEmpty) {
      throw showErrorMessage('検索結果が0件です');
    } else {
      return attractions;
    }
  }

  void moveResult(List<Attraction> attractions) {
    Navigator.pushNamed(context, Routes.result, arguments: {
      'attractions': attractions,
    });
  }

  bool parkMustBeNotNull(String? park) {
    if (park == null || park.isEmpty) {
      return false;
    }
    return true;
  }

  bool categoryMustBeNotNull(int? category) {
    if (category == null || category == 0) {
      return false;
    }
    return true;
  }

  showErrorMessage(String errorMessage) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(errorMessage),
      backgroundColor: Colors.red,
      action: SnackBarAction(
          label: 'OK',
          textColor: Colors.white,
          onPressed: () => ScaffoldMessenger.of(context).hideCurrentSnackBar()),
    ));
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
              BaseSelect(
                  option: attraction_const.parkOption,
                  hintText: 'パーク',
                  onSelected: (value) => setPark(value)),
              BaseSelect(
                  option: attraction_const.categoryOption,
                  hintText: 'カテゴリ',
                  onSelected: (value) => setCaterogy(value)),
              BaseButton(
                  label: '検索',
                  onPressed: () async {
                    if (parkMustBeNotNull(park) &&
                        categoryMustBeNotNull(category)) {
                      List<Attraction> attractions = await search(getUrl());
                      moveResult(attractions);
                    } else {
                      showErrorMessage('選択肢を選んでください');
                    }
                  })
            ],
          ),
        ));
  }
}
