import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;

main() async {
  final target = Uri.parse('https://tokyodisneyresort.info/restOne.php?id=6');
  final response = await http.get(target);
  final document = parse(response.body);
  String url =
      document.querySelector('.info-data .info-data-value a')!.attributes['href'].toString();
  print(url);
}
