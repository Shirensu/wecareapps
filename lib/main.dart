import 'package:flutter/material.dart';
//import 'package:wecareapps/pages/appointment_form.dart';
import 'package:wecareapps/pages/home.dart';
//import 'package:wecareapps/pages/event.dart';
//import 'package:wecareapps/pages/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
