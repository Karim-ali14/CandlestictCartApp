import 'package:flutter/material.dart';

import '../helper/unit.dart';

class BiometricAuthentication extends StatefulWidget {
  const BiometricAuthentication({Key? key})
      : super(key: key);

  @override
  State<BiometricAuthentication> createState() =>
      _BiometricAuthenticationState();
}

class _BiometricAuthenticationState extends State<BiometricAuthentication> {
  @override
  void initState() {
    AppUnitHelper.authenticateUser().then((value) {
      if (value) {

      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }


}