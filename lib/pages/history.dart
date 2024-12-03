import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              "Activity Log",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16),
            ActivityLogCard(
              title: "Psi. Hanif Reyhan Aziz",
              description: "deskripsi",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetailPage()),
                );
              },
            ),
            ActivityLogCard(
              title: "Psi. Herlita",
              description: "deskripsi",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetailPage()),
                );
              },
            ),
            ActivityLogCard(
              title: "Psi. Azzikra Raya",
              description: "deskripsi",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetailPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ActivityLogCard extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onTap;

  const ActivityLogCard({
    Key? key,
    required this.title,
    required this.description,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 4),
              Text(
                description,
                style: TextStyle(color: Colors.black54),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.greenAccent,
              foregroundColor: Colors.black,
            ),
            child: Text("Detail"),
          ),
        ],
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Hasil Observasi",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Nama :",
              style: TextStyle(fontSize: 16),
            ),
            Text(
              "Tanggal Observasi :",
              style: TextStyle(fontSize: 16),
            ),
            Text(
              "Tujuan Observasi :",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text("grafik"),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text("aspek"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
