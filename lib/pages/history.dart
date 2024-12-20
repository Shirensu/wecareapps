import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              description: "Deskripsi observasi Hanif",
              tanggal: "10 Desember 2024",
              tujuan: "Memulai",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(
                      title: "Psi. Hanif Reyhan Aziz",
                      description: "Deskripsi observasi Hanif",
                      tanggal: "10 Desember 2024",
                      tujuan: "Memulai",
                    ),
                  ),
                );
              },
            ),
            ActivityLogCard(
              title: "Psi. Herlita",
              description: "Deskripsi observasi Herlita",
              tanggal: "10 Desember 2024",
              tujuan: "Memulai",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(
                      title: "Psi. Herlita",
                      description: "Deskripsi observasi Herlita",
                      tanggal: "10 Desember 2024",
                      tujuan: "Memulai",
                    ),
                  ),
                );
              },
            ),
            ActivityLogCard(
              title: "Psi. Azzikra Raya",
              description: "Deskripsi observasi Azzikra",
              tanggal: "10 Desember 2024",
              tujuan: "Memulai",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(
                      title: "Psi. Azzikra Raya",
                      description: "Deskripsi observasi Azzikra",
                      tanggal: "10 Desember 2024",
                      tujuan: "Memulai",
                    ),
                  ),
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
  final String tanggal;
  final String tujuan;
  final VoidCallback onTap;

  const ActivityLogCard({
    Key? key,
    required this.title,
    required this.description,
    required this.tanggal,
    required this.tujuan,
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
  final String title;
  final String description;
  final String tanggal;
  final String tujuan;

  const DetailPage({
    Key? key,
    required this.title,
    required this.description,
    required this.tanggal,
    required this.tujuan,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Hasil Observasi",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.greenAccent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Nama : $title", // Menampilkan nama berdasarkan data
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              "Deskripsi : $description", // Menampilkan deskripsi berdasarkan data
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              "Tanggal Observasi : $tanggal",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              "Tujuan Observasi : $tujuan",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 200, // Set the height for the graph
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(show: false),
                  titlesData: FlTitlesData(show: false),
                  borderData: FlBorderData(
                      show: true, border: Border.all(color: Colors.black)),
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        FlSpot(0, 1),
                        FlSpot(1, 2),
                        FlSpot(2, 1.5),
                        FlSpot(3, 2),
                        FlSpot(4, 2.5),
                      ],
                      isCurved: true,
                      color: Colors.blue,
                      barWidth: 4,
                      belowBarData: BarAreaData(show: false),
                    ),
                  ],
                ),
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
                  child: Text(
                      "Berdasarkan program yang diberikan, target yang akan dicapai adalah memfokuskan Ananda untuk bisa berinteraksi dengan teman sosialnya dari segi bertanya hingga menjawab dengan Gerakan,serta akademik Ananda yang harus ditingkatkan lagi . Kami harap program ini akan membuat perkembangan Ananda jauh lebih baik daripada sebelumnya."),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
