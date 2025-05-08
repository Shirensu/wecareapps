import 'package:flutter/material.dart';

class FormDetailsPage extends StatelessWidget {
  final String parentName;
  final String childName;
  final DateTime selectedDate;
  final String selectedTime;
  final String description;

  const FormDetailsPage({
    Key? key,
    required this.parentName,
    required this.childName,
    required this.selectedDate,
    required this.selectedTime,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appointment Details'),
        backgroundColor: Colors.greenAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDetailItem('Parent Name', parentName),
            _buildDetailItem('Child Name', childName),
            _buildDetailItem(
                'Date', selectedDate.toLocal().toString().split(' ')[0]),
            _buildDetailItem('Time', selectedTime),
            _buildDetailItem('Description', description),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
