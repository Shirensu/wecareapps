import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.greenAccent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          // Background or other content
          Column(
            children: [
              Container(
                height: 100, // Adjust height for spacing under the logo
                color: Colors.greenAccent, // Background color if needed
              ),
              Expanded(
                child: Container(
                  color: Colors.white, // Content background color
                  child: Center(
                    child: Text(
                      'Welcome to your profile!',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Profile logo in the top center
          Positioned(
            top: 50, // Distance from the top
            left: 0,
            right: 0,
            child: CircleAvatar(
              radius: 50, // Radius of the profile logo
              backgroundImage: AssetImage(
                  'assets/profile_image.jpg'), // Replace with your asset
              backgroundColor: Colors.grey[200], // Fallback background color
            ),
          ),
        ],
      ),
    );
  }
}
