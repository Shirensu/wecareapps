import 'package:flutter/material.dart';
import 'package:wecareapps/splash_screen_2.dart';

class SplashScreen1 extends StatelessWidget {
  const SplashScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SplashScreen2()),
          );
        },
        child: const Text('WeCare'),
      )),
    );
  }
}
