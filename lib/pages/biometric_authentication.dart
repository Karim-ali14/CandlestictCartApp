import 'package:flutter/material.dart';
import '../helper/unit.dart';
import 'home_screen.dart';

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
    _authenticateUser();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _authenticateUser();
          },
          child: const Text('Authenticate'),
        ),

      ),
    );
  }

  void _authenticateUser() {
    AppUnitHelper.authenticateUser().then((value) {
      if (value) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      }
    });
  }

}