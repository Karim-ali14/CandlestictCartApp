import 'package:http/http.dart' as http;
import '../commin/constants.dart';

class ServiceApi {

  static Future<String> fetchCandles(
      String ticker , String period1 , String period2 , String interval
      ,String events, String crumb) async {
    final res = await http.get(
        Uri.parse("${Constants.baseUrl}$ticker?period1=$period1&period2=$period2&interval=$interval&events=$events&crumb=$crumb")
    );
    if (res.statusCode == 200) {
      return res.body;
    } else {
      throw Exception('Failed to load candles');
    }

  }

}