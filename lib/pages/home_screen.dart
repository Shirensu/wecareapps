import 'package:flutter/material.dart';
import 'appointment_form.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // List to store appointments
  List<Map<String, String>> appointments = [];

  // Method to add a new appointment
  void _addAppointment(Map<String, String> newAppointment) {
    setState(() {
      appointments.add(newAppointment);
      print('Updated appointments: $appointments'); // Log the updated list
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: appointments.isEmpty
                ? const Center(
                    child: Text(
                      'No Appointments Yet!',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  )
                : ListView.builder(
                    itemCount: appointments.length,
                    itemBuilder: (context, index) {
                      final appointment = appointments[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 16.0),
                        child: ListTile(
                          title: Text(
                            "Anak: ${appointment['childName'] ?? ''}",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                              "Tanggal: ${appointment['date']}, Jam: ${appointment['time']}"),
                          trailing: const Icon(Icons.check_circle,
                              color: Colors.green),
                        ),
                      );
                    },
                  ),
          ),
          // Add some space above the button to move it upward
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () async {
              final newAppointment = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AppointmentFormPage()),
              );

              if (newAppointment != null) {
                print(
                    'Received new appointment: $newAppointment'); // Log received data
                _addAppointment(newAppointment);
              }
            },
            child: Container(
              width: 350,
              height: 100,
              margin:
                  const EdgeInsets.only(bottom: 20), // Adjust the bottom margin
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1.0),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Center(
                child: Icon(
                  Icons.add,
                  size: 60,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
