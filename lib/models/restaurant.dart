class Restaurant {
  final String seats;
  final String place;
  final String serviceType;
  final String publicUrl;
  final String keyWord;
  final String url;

  Restaurant({
    required String seats,
    required String place,
    required String serviceType,
    required String publicUrl,
    required String keyWord,
    required this.url,
  })  : seats = seats == '席' ? '不明' : seats,
        place = place.endsWith('の') ? '不明' : place,
        serviceType = serviceType == '' ? '不明' : serviceType,
        publicUrl = publicUrl == '' ? '不明のためホームページを表示します' : publicUrl,
        keyWord = keyWord == '' ? 'なし' : keyWord;
}
