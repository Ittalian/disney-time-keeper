import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;

main() async {
  final target = Uri.parse(
      'https://tokyodisneyresort.info/realtime.php?order=name&park=sea');
  final response = await http.get(target);
  final document = parse(response.body);
  final hrefList = document
        .querySelectorAll('.realtime-attr a')
        .map((tag) => tag.attributes['href'])
        .toList();
  print(hrefList);
}
