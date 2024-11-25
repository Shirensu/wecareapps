import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:wecareapps/pages/event.dart';
import 'package:wecareapps/pages/history.dart';
import 'package:wecareapps/pages/profile.dart';
import 'package:wecareapps/pages/home_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  final List<Widget> _pages = [
    HomeScreen(),
    EventPage(),
    HistoryPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        items: const <Widget>[
          Icon(Icons.calendar_today_rounded, size: 25),
          Icon(Icons.event, size: 25),
          Icon(Icons.history, size: 25),
          Icon(Icons.person, size: 25),
        ],
        color: Colors.greenAccent,
        buttonBackgroundColor: Colors.greenAccent,
        backgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
        letIndexChange: (index) => true,
      ),
      body: _pages[_page], // Switch the page based on the index
    );
  }
}
