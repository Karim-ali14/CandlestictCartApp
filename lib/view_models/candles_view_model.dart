import 'package:flutter/foundation.dart';
import 'package:interactive_chart/interactive_chart.dart';

import '../commin/constants.dart';
import '../helper/unit.dart';
import '../service/service_api.dart';

class CandleViewModel extends ChangeNotifier {
  List<CandleData> _candles = [];
  List<CandleData> get candles => _candles;

  void setCandles(List<CandleData> candles) {
    _candles = candles;
    notifyListeners();
  }

  Future<void> fetchCandles({String? period1, String? period2, String? interval}) async {
    final res = await ServiceApi.fetchCandles(
        Constants.ticker, period1 ?? Constants.period1, period2 ?? Constants.period2, interval ?? Constants.interval, Constants.events, Constants.crumb
    );
    setCandles(AppUnitHelper.parseCandles(res));
  }
}