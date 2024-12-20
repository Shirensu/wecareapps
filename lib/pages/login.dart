import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:wecareapps/widget/panel_widget.dart';
//import 'package:wecareapps/pages/home.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final panelHeightClosed = MediaQuery.of(context).size.height * 0.05;
    final panelHeightOpen = MediaQuery.of(context).size.height * 0.8;

    return Scaffold(
      backgroundColor: Colors.greenAccent, // Background color
      body: SlidingUpPanel(
        borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
        maxHeight: panelHeightOpen,
        minHeight: panelHeightClosed,
        // parallaxEnabled: true,
        // parallaxOffset: .5,
        panelBuilder: (controller) => PanelWidget(controller: controller),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo Image
            Padding(
              padding: const EdgeInsets.only(bottom: 50.0),
              child: Image.asset('assets/img/wecare_login.png',
                  height: 500.0), // Replace with your logo asset
            ),
          ],
        ),
      ),
    );
  }
}
