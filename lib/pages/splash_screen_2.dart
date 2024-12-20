import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wecareapps/pages/login.dart'; // Replace with your login page file.

class SplashScreen2 extends StatefulWidget {
  const SplashScreen2({super.key});

  @override
  _SplashScreen2State createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2> {
  @override
  void initState() {
    super.initState();

    // Navigate to LoginPage after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        PageTransition(
          type: PageTransitionType.fade, // Use fade transition
          child: const LoginScreen(), // Navigate to your login page
          duration: const Duration(milliseconds: 800), // Transition duration
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Center(
        child: Text(
          'Welcome',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
