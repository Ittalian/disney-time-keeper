const String baseUrl = 'https://tokyodisneyresort.info/';
const String attractionUrl = '${baseUrl}realtime.php?order=name&park=';
const String greetingUrl = '${baseUrl}greeting_realtime.php?order=name&park=';
const String restaurantUrl = '${baseUrl}restwait.php?order=name&park=';

const Map<String, String> parkOption = {
  'シー': 'sea',
  'ランド': 'rand',
};

const Map<String, String> categoryOption = {
  'アトラクション': '1',
  'グリーティング': '2',
  'レストラン': '3',
};
