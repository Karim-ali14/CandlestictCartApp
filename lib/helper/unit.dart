import 'package:flutter/services.dart';
import 'package:interactive_chart/interactive_chart.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth/error_codes.dart' as local_auth_error;

class AppUnitHelper {

  static final _localAuthentication = LocalAuthentication();

  static Future<bool> authenticateUser() async {

    bool isAuthorized = false;
    try {
      isAuthorized = await _localAuthentication.authenticate(
        localizedReason: "Please authenticate to see account balance",
        options: const AuthenticationOptions(
          biometricOnly: true,
          useErrorDialogs: true,
          stickyAuth: false,
        ),
      );

    } on PlatformException catch (exception) {
      if (exception.code == local_auth_error.notAvailable ||
          exception.code == local_auth_error.passcodeNotSet ||
          exception.code == local_auth_error.notEnrolled) {
        isAuthorized = false;
      }
    }

    return isAuthorized;
  }

  static List<CandleData> parseCandles(String body) {
    final List<String> lines = body.split("\n");
    lines.removeAt(0);
    final List<CandleData> candles = [];
    for (var element in lines) {
      final List<String> values = element.split(",");
      print("result Of date ${DateTime.parse(values[0].toString())}");
      candles.add(CandleData(
        timestamp: DateTime.parse(values[0]).millisecondsSinceEpoch,
        open: double.parse(values[1]),
        high: double.parse(values[2]),
        low: double.parse(values[3]),
        close: double.parse(values[4]),
        volume: double.parse(values[5]),
      ));
    }
    return candles;
  }

}