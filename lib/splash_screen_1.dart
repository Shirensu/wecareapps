import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wecareapps/splash_screen_2.dart';

class SplashScreen1 extends StatefulWidget {
  const SplashScreen1({super.key});

  @override
  _SplashScreen1State createState() => _SplashScreen1State();
}

class _SplashScreen1State extends State<SplashScreen1> {
  @override
  void initState() {
    super.initState();

    // Navigate to SplashScreen2 after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        PageTransition(
          type: PageTransitionType.leftToRight, // Transition type
          child: SplashScreen2(), // The next screen
          duration: const Duration(milliseconds: 800), // Transition duration
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: 500,
          height: 1000,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.blue, width: 2),
          ),
          child: Image.asset(
            'assets/img/wecare_logo.png',
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
