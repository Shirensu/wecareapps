import 'package:flutter/material.dart';
import 'package:wecareapps/pages/home.dart';
import 'package:wecareapps/pages/login.dart';
import 'package:wecareapps/pages/signup.dart';
import 'package:wecareapps/services/api_service.dart';
import 'package:provider/provider.dart';
import 'package:wecareapps/providers/form_state_provider.dart';

class PanelWidget extends StatefulWidget {
  final ScrollController controller;

  const PanelWidget({Key? key, required this.controller}) : super(key: key);

  @override
  _PanelWidgetState createState() => _PanelWidgetState();
}

class _PanelWidgetState extends State<PanelWidget> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final ApiService _apiService = ApiService();
  bool _isLoading = false;
  String? _errorMessage;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final response = await _apiService.login(
        _emailController.text.trim(),
        _passwordController.text,
      );

      if (response['ResponseCode'] == 200) {
        // Login successful, navigate to home
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      } else {
        // Login failed, show error message
        setState(() {
          _errorMessage = response['ResponseMessage'] ?? 'Login failed';
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'An error occurred: ${e.toString()}';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) => ListView(
        padding: EdgeInsets.zero,
        controller: widget.controller,
        children: <Widget>[
          SizedBox(height: 36),
          buildLoginBox(context),
          SizedBox(height: 24),
        ],
      );

  Widget buildLoginBox(BuildContext context) => Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            buildDragHandle(),
            SizedBox(height: 18),
            Center(
              child: Text(
                'Login',
                style: TextStyle(fontSize: 36.0),
              ),
            ),
            if (_errorMessage != null)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  _errorMessage!,
                  style: TextStyle(color: Colors.red),
                ),
              ),
            SizedBox(height: 12),
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
            SizedBox(height: 18),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () {
                  // Forgot Password Action
                },
                child: Text(
                  'Forgot password?',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.greenAccent,
                foregroundColor: Colors.black,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              onPressed: _isLoading ? null : _login,
              child: _isLoading
                  ? CircularProgressIndicator(color: Colors.white)
                  : Text('Login'),
            ),
            TextButton(
              onPressed: () {
                // Navigate to SignUpScreen
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => SignUpScreen()));
              },
              child: Text('Sign Up'),
            ),
          ],
        ),
      );

  Widget buildDragHandle() => Center(
        child: Container(
          width: 30,
          height: 5,
          decoration: BoxDecoration(
            color: Colors.grey[300],
          ),
        ),
      );
}
