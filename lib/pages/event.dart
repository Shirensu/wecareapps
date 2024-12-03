import 'package:flutter/material.dart';

class EventPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.only(top: 75, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.black)),
                      child: Text("Education"),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.black)),
                      child: Text("Education"),
                    ),
                  ],
                )
                // Text(
                //   'Buat Jadwal Anda Dengan Psikolog Profesional',
                //   textAlign: TextAlign.center,
                //   style: TextStyle(
                //     fontSize: 16,
                //     fontWeight: FontWeight.w400,
                //     color: Colors.black,
                //   ),
                // ),
                ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      // Add action here
                    },
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1.0),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  )
                ],
              ),
              // Text(
              //   'Buat Jadwal Anda Dengan Psikolog Profesional',
              //   textAlign: TextAlign.center,
              //   style: TextStyle(
              //     fontSize: 16,
              //     fontWeight: FontWeight.w400,
              //     color: Colors.black,
              //   ),
              // ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      // Add action here
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.15,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1.0),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  )
                ],
              ),
              // Text(
              //   'Buat Jadwal Anda Dengan Psikolog Profesional',
              //   textAlign: TextAlign.center,
              //   style: TextStyle(
              //     fontSize: 16,
              //     fontWeight: FontWeight.w400,
              //     color: Colors.black,
              //   ),
              // ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      // Add action here
                    },
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1.0),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  )
                ],
              ),
              // Text(
              //   'Buat Jadwal Anda Dengan Psikolog Profesional',
              //   textAlign: TextAlign.center,
              //   style: TextStyle(
              //     fontSize: 16,
              //     fontWeight: FontWeight.w400,
              //     color: Colors.black,
              //   ),
              // ),
            ),
          ],
        ),
      ),
    );
  }
}
