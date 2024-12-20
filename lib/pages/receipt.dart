import 'package:flutter/material.dart';

class ReceiptScreen extends StatelessWidget {
  final DateTime date;
  final String time;
  final String parentName;
  final String childName;
  final String description;

  const ReceiptScreen({
    Key? key,
    required this.date,
    required this.time,
    required this.parentName,
    required this.childName,
    required this.description,
  }) : super(key: key);

  void _handlePayment(BuildContext context) {
    // Show a success popup and pass data back to HomeScreen
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Payment Successful'),
          content: const Text('Your payment has been successfully processed.'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                Navigator.of(context).pop(); // Close the ReceiptScreen
                Navigator.of(context).pop({
                  'date': date.toLocal().toString().split(' ')[0],
                  'time': time,
                  'childName': childName,
                  'description': description,
                }); // Pass data back to HomeScreen
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Receipt'),
        backgroundColor: Colors.greenAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 32.0),
                      decoration: BoxDecoration(
                        color: Colors.lightGreenAccent,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: const Text(
                        'RESI',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Text('DATE: ${date.toLocal().toString().split(' ')[0]}'),
                  const SizedBox(height: 8.0),
                  Text('BOOKING TIME: $time'),
                  const SizedBox(height: 16.0),
                  Text('Nama Orang Tua/Wali: $parentName'),
                  const SizedBox(height: 8.0),
                  Text('Nama Anak: $childName'),
                  const SizedBox(height: 16.0),
                  Text('Description: $description'),
                  const SizedBox(height: 16.0),
                  const Text(
                    'PAYMENT DETAIL',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Consultation'),
                      Text('\Rp.10.000'),
                    ],
                  ),
                  const Divider(
                    color: Colors.black,
                    thickness: 1,
                    endIndent: 8,
                    indent: 8,
                    height: 16.0,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: const Text(
                      '\Rp.10.000',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightGreenAccent,
              ),
              onPressed: () {
                _handlePayment(context);
              },
              child: const Text(
                'Bayar jadwal',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
