import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wecareapps/pages/splash_screen_1.dart';
import 'package:wecareapps/providers/form_state_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FormStateProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WeCareApps',
      theme: ThemeData(primarySwatch: Colors.green),
      home: SplashScreen1(), // Starts with SplashScreen1
    );
  }
}
