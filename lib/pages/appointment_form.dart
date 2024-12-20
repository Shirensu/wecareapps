import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wecareapps/providers/form_state_provider.dart';

class AppointmentForm extends StatefulWidget {
  @override
  _AppointmentFormState createState() => _AppointmentFormState();
}

class _AppointmentFormState extends State<AppointmentForm> {
  final _parentNameController = TextEditingController();
  final _childNameController = TextEditingController();
  final _descriptionController = TextEditingController();

  DateTime? _selectedDate;
  String _selectedSlot = '';
  String _selectedTime = '';

  @override
  Widget build(BuildContext context) {
    final formState = Provider.of<FormStateProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Buat Jadwal'),
        backgroundColor: Colors.greenAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Date Picker
            TextField(
              controller: TextEditingController(
                  text: _selectedDate != null
                      ? '${_selectedDate!.toLocal()}'.split(' ')[0]
                      : ''),
              decoration: InputDecoration(
                labelText: '',
                suffixIcon: IconButton(
                  icon: Icon(Icons.calendar_today),
                  onPressed: () => _pickDate(context),
                ),
                hintText: 'Pilih tanggal',
                border: OutlineInputBorder(),
              ),
              readOnly: true,
            ),
            SizedBox(height: 16),
            // Parent Name Field
            TextField(
              controller: _parentNameController,
              decoration: InputDecoration(
                labelText: 'Nama orang tua/wali',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            // Child Name Field
            TextField(
              controller: _childNameController,
              decoration: InputDecoration(
                labelText: 'Nama anak',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            // Time Slot Selector
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildSlotButton('Pagi'),
                _buildSlotButton('Sore'),
              ],
            ),
            SizedBox(height: 16),
            // Time Range Selector
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildTimeButton('09:00 - 10:00'),
                _buildTimeButton('10:00 - 11:00'),
              ],
            ),
            SizedBox(height: 16),
            // Description Field
            TextField(
              controller: _descriptionController,
              maxLines: 4,
              decoration: InputDecoration(
                labelText: 'Keluhan secara singkat',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            // Submit Button
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent,
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: () {
                  if (_parentNameController.text.isEmpty ||
                      _childNameController.text.isEmpty ||
                      _selectedSlot.isEmpty ||
                      _selectedTime.isEmpty ||
                      _descriptionController.text.isEmpty ||
                      _selectedDate == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Harap lengkapi semua bidang!'),
                      ),
                    );
                    return;
                  }
                  formState.addForm(
                    parentName: _parentNameController.text,
                    childName: _childNameController.text,
                    selectedDate: _selectedDate!,
                    selectedTime: _selectedTime,
                    description: _descriptionController.text,
                  );
                  Navigator.pop(context);
                },
                child: Text('Buat jadwal'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSlotButton(String slot) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor:
            _selectedSlot == slot ? Colors.greenAccent : Colors.grey[300],
      ),
      onPressed: () {
        setState(() {
          _selectedSlot = slot;
        });
      },
      child: Text(slot),
    );
  }

  Widget _buildTimeButton(String time) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor:
            _selectedTime == time ? Colors.greenAccent : Colors.grey[300],
      ),
      onPressed: () {
        setState(() {
          _selectedTime = time;
        });
      },
      child: Text(time),
    );
  }

  Future<void> _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }
}
