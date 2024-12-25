import 'package:flutter/material.dart';
import 'package:wecareapps/pages/login_page.dart';

class ProfilePage extends StatelessWidget {
  final String name = "WeCare";
  final String username = "WeCareAdmin";
  final String email = "WeCare@business.co.id";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Icon Profil
            Icon(
              Icons.account_circle,
              size: 100, // Ukuran ikon
              color: Colors.black, // Warna ikon
            ),
            SizedBox(height: 20),
            // Menampilkan Nama
            _buildStaticField('Nama', name),
            SizedBox(height: 10),
            // Menampilkan Username
            _buildStaticField('Username', username),
            SizedBox(height: 10),
            // Menampilkan Email
            _buildStaticField('Email', email),
            SizedBox(height: 20),
            // Tombol Change Password
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChangePasswordPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.greenAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text('Change password',
                  style: TextStyle(color: Colors.black)),
            ),
            SizedBox(height: 20),
            // Tombol Log Out
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text('Log Out', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi untuk membuat tampilan field statis
  Widget _buildStaticField(String label, String value) {
    return Container(
      width: 300, // Lebar field
      padding: EdgeInsets.all(16), // Padding dalam kontainer
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1.0),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

// Halaman Ubah Password
class ChangePasswordPage extends StatelessWidget {
  final String email = "WeCare@business.co.id";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildStaticField('Email', email),
            SizedBox(height: 10),
            _buildTextField('Password Baru'),
            SizedBox(height: 10),
            _buildTextField('Konfirmasi Password'),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Batal', style: TextStyle(color: Colors.black)),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    _showSuccessDialog(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text('Confirm', style: TextStyle(color: Colors.black)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Berhasil!'),
          content: Text('Password berhasil diganti.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.popUntil(
                  context,
                  (route) => route.isFirst,
                ); // Tutup dialog
              },
              child: Text('Kembali'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildStaticField(String label, String value) {
    return Container(
      width: 300, // Lebar field
      padding: EdgeInsets.all(16), // Padding dalam kontainer
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1.0),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  // Fungsi untuk membuat TextField
  Widget _buildTextField(String label) {
    return Container(
      width: 300,
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1.0),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: label,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
