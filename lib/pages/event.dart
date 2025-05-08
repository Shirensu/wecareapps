import 'package:flutter/material.dart';

class EventPage extends StatefulWidget {
  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  // Variable to track the selected category for filtering
  String selectedCategory = "Education";

  // List of images and descriptions
  final List<Map<String, String>> educationItems = [
    {
      "image": "assets/img/buku.jpg", // Replace with your image path
      "description": "Pendidikan Dan Bimbingan Anak Berkebutuhan Khusus"
    },
    {
      "image": "assets/img/buku2.jpg", // Replace with your image path
      "description": "Anak Berkebutuhan Khusus, Lancar Membaca dan Menulis"
    },
  ];

  final List<Map<String, String>> seminarItems = [
    {
      "image": "assets/img/Events.png", // Replace with your image path
      "description": "Mental Health Awareness in Hybrid Seminars"
    },
    {
      "image": "assets/img/Events.png", // Replace with your image path
      "description": "Bringing Mental Health Awareness to Students"
    },
  ];

  // Function to display the content based on the selected category
  List<Widget> getFilteredItems() {
    if (selectedCategory == "Education") {
      return educationItems.map((item) {
        return Padding(
          padding: const EdgeInsets.symmetric(
              vertical: 8.0), // Add space between rows
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Image.asset(item["image"]!),
              ),
              SizedBox(width: 10),
              Expanded(
                flex: 2,
                child: Text(item["description"]!,
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
              ),
            ],
          ),
        );
      }).toList();
    } else {
      return seminarItems.map((item) {
        return Padding(
          padding: const EdgeInsets.symmetric(
              vertical: 8.0), // Add space between rows
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Image.asset(item["image"]!),
              ),
              SizedBox(width: 10),
              Expanded(
                flex: 2,
                child: Text(item["description"]!,
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
              ),
            ],
          ),
        );
      }).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 100), // Add space above the buttons

            // Buttons for selecting category
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedCategory = "Education";
                    });
                  },
                  child: Text("Education"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: selectedCategory == "Education"
                        ? Colors.greenAccent
                        : Colors.grey,
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedCategory = "Seminar";
                    });
                  },
                  child: Text("Seminar"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: selectedCategory == "Seminar"
                        ? Colors.greenAccent
                        : Colors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            // Display images based on selected category
            Expanded(
              child: ListView(
                children: [
                  // First, show the filtered items (Education or Seminar)
                  ...getFilteredItems(),

                  // Then, show the new row just like the others in the ListView
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0), // Add space before the new row
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Image.asset(
                              "assets/img/Events.png"), // Replace with your image path
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          flex: 2,
                          child: Text(
                            "New Event: Workshop on Mental Health",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
