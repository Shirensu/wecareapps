import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class AppoinmentFormPage extends StatefulWidget {
  const AppoinmentFormPage({super.key});

  @override
  State<AppoinmentFormPage> createState() => _AppoinmentFormPageState();
}

class _AppoinmentFormPageState extends State<AppoinmentFormPage> {
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: _page,
          items: <Widget>[
            Icon(
              Icons.calendar_today_rounded,
              size: 25,
            ),
            Icon(
              Icons.event,
              size: 25,
            ),
            Icon(
              Icons.history,
              size: 25,
            ),
            Icon(
              Icons.person,
              size: 25,
            ),
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
        body: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(top: 75, left: 10, right: 10),
                  child: Row(
                    children: [
                      Expanded(
                          child: TextField(
                        decoration: InputDecoration(
                          hintText: "",
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2),
                              borderRadius: BorderRadius.circular(8)),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      )),
                      Padding(
                          padding: EdgeInsets.only(right: 10, left: 10),
                          child: Icon(
                            Icons.calendar_today,
                            size: 50,
                          ))
                    ],
                  )),
              Padding(
                  padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                  child: Row(
                    children: [
                      Expanded(
                          child: TextField(
                        decoration: InputDecoration(
                          hintText: "Nama Orang tua/wali",
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2),
                              borderRadius: BorderRadius.circular(8)),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      )),
                    ],
                  )),
              Padding(
                  padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                  child: Row(
                    children: [],
                  )),
            ],
          ),
        ));
  }
}
