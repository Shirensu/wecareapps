import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wecareapps/pages/login.dart'; // Replace with your login page file.

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _showLogo = true;

  @override
  void initState() {
    super.initState();
    _startSplashScreenTimer();
  }

  _startSplashScreenTimer() async {
    await Future.delayed(Duration(seconds: 3));
    setState(() {
      _showLogo = false;
    });
    await Future.delayed(Duration(seconds: 2));
    Navigator.pushReplacement(
      context,
      PageTransition(
        type: PageTransitionType.fade,
        child: const LoginScreen(),
        duration: const Duration(milliseconds: 800),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: Duration(seconds: 1),
        color: _showLogo ? Colors.white : Colors.greenAccent,
        child: Center(
          child: AnimatedOpacity(
            opacity: _showLogo ? 1.0 : 0.0,
            duration: Duration(seconds: 1),
            child: _showLogo
                ? Image.asset('assets/img/wecare_login.png',
                    fit: BoxFit.contain)
                : Text(
                    'Welcome',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
