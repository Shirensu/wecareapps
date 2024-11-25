import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:wecareapps/widget/panel_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final panelHeightClosed = MediaQuery.of(context).size.height * 0.05;
    final panelHeightOpen = MediaQuery.of(context).size.height * 0.8;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFA8F3EA),
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Color(0xFFA8F3EA), // Background color
      body: SlidingUpPanel(
        borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
        maxHeight: panelHeightOpen,
        minHeight: panelHeightClosed,
        // parallaxEnabled: true,
        // parallaxOffset: .5,
        panelBuilder: (controller) => PanelWidgetSignUp(controller: controller),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo Image
            Padding(
              padding: const EdgeInsets.only(bottom: 50.0),
              child: Image.asset('assets/img/wecare_logo.png',
                  height: 500.0), // Replace with your logo asset
            ),
          ],
        ),
      ),
    );
  }
}
