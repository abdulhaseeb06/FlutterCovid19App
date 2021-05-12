import 'package:http/http.dart' as http;

class NovelAPI {
  static Future<String> getStats(String country) async {
    Uri url;
    if (country == 'All') {
      url = Uri.parse('https://corona.lmao.ninja/v2/all');
    } else {
      url = Uri.parse('https://corona.lmao.ninja/v2/countries/$country');
    }
    final apiResponse = await http.get(url);
    print(apiResponse);
    return apiResponse.body;
  }
}
