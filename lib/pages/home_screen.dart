import 'package:flutter/material.dart';
import 'package:wecareapps/pages/appointment_form.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Buat Jadwal Anda Dengan Psikolog Profesional',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AppointmentFormPage()));
                },
                child: Container(
                  width: 350,
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1.0),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.add,
                      size: 60,
                      color: Colors.black,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
