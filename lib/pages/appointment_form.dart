import 'package:flutter/material.dart';

class AppointmentFormPage extends StatefulWidget {
  @override
  _AppointmentFormPageState createState() => _AppointmentFormPageState();
}

class _AppointmentFormPageState extends State<AppointmentFormPage> {
  DateTime? _selectedDate; // Holds the selected date
  String? _selectedTime; // Holds the selected time slot

  // Function to show the date picker
  Future<void> _pickDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate; // Update the selected date
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appointment Form'),
        backgroundColor: Colors.greenAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Calendar Selection Row with Border
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _selectedDate == null
                          ? 'Pilih Tanggal'
                          : ' ${_selectedDate!.toLocal().toString().split(' ')[0]}',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.calendar_today,
                        size: 32,
                        color: Colors.greenAccent,
                      ),
                      onPressed: () => _pickDate(context),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              // Parent Name Field
              _buildTextField('Nama Orang Tua/Wali'),
              SizedBox(height: 20),
              // Child Name Field
              _buildTextField('Nama Anak'),
              SizedBox(height: 20),
              // Time Selection Buttons
              Text(
                'Pilih Waktu:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildTimeButton('Pagi', '10:00 - 11:00'),
                    _buildTimeButton('Sore', '16:00 - 17:00'),
                  ],
                ),
              ),
              SizedBox(height: 20),
              // Description Field
              _buildLargeTextField('Description'),
              SizedBox(height: 30),
              // Submit Button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Submit form action
                    print("Appointment Submitted: Time: $_selectedTime");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  ),
                  child: Text(
                    'Submit',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Reusable Time Button Widget
  Widget _buildTimeButton(String label, String time) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _selectedTime = time; // Update the selected time slot
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: _selectedTime == time
            ? Colors.greenAccent // Highlight selected button
            : Colors.grey.shade300, // Default button color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        '$label\n$time',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: _selectedTime == time ? Colors.black : Colors.grey.shade800,
        ),
      ),
    );
  }

  // Reusable Text Field Widget
  Widget _buildTextField(String label) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
    );
  }

  // Reusable Large Text Field Widget for Description
  Widget _buildLargeTextField(String label) {
    return TextField(
      maxLines: 10,
      textAlign: TextAlign.start,
      decoration: InputDecoration(
        hintText: label,
        border: OutlineInputBorder(),
      ),
    );
  }
}
