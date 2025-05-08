import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  // Base URL for your API
  static const String baseUrl =
      'http://10.0.2.2:5000'; // Use this for Android emulator
  // static const String baseUrl = 'http://127.0.0.1:5000'; // Use this for iOS simulator
  // static const String baseUrl = 'https://your-production-api.com'; // Production URL

  // Token storage keys
  static const String tokenKey = 'auth_token';
  static const String userIdKey = 'user_id';
  static const String userNameKey = 'user_name';
  static const String userEmailKey = 'user_email';

  // Headers for API requests
  Future<Map<String, String>> _getHeaders({bool requiresAuth = true}) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    if (requiresAuth) {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString(tokenKey);
      if (token != null) {
        headers['Authorization'] = 'Bearer $token';
      }
    }

    return headers;
  }

  // Login method
  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/v1/user/login'),
        headers: await _getHeaders(requiresAuth: false),
        body: jsonEncode({
          'Email': email,
          'Password': password,
        }),
      );

      final data = jsonDecode(response.body);

      if (data['ResponseCode'] == 200 &&
          data['Result'] != null &&
          data['Result'].isNotEmpty) {
        // Save auth data to SharedPreferences
        final prefs = await SharedPreferences.getInstance();
        final userData = data['Result'][0];

        await prefs.setString(tokenKey, userData['Token']);
        await prefs.setInt(userIdKey, userData['UserId']);
        await prefs.setString(userNameKey, userData['UserName']);
        await prefs.setString(userEmailKey, userData['UserEmail']);
      }

      return data;
    } catch (e) {
      return {
        'ResponseCode': 500,
        'ResponseMessage': 'Network error: ${e.toString()}',
      };
    }
  }

  // Register method
  Future<Map<String, dynamic>> register(
      String username, String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/v1/user/register'),
        headers: await _getHeaders(requiresAuth: false),
        body: jsonEncode({
          'Username': username,
          'Email': email,
          'Password': password,
        }),
      );

      return jsonDecode(response.body);
    } catch (e) {
      return {
        'ResponseCode': 500,
        'ResponseMessage': 'Network error: ${e.toString()}',
      };
    }
  }

  // Change password method
  Future<Map<String, dynamic>> changePassword(
      int userId, String oldPassword, String newPassword) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/v1/user/change_password'),
        headers: await _getHeaders(),
        body: jsonEncode({
          'UserID': userId,
          'OldPassword': oldPassword,
          'NewPassword': newPassword,
        }),
      );

      return jsonDecode(response.body);
    } catch (e) {
      return {
        'ResponseCode': 500,
        'ResponseMessage': 'Network error: ${e.toString()}',
      };
    }
  }

  // Logout method
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(tokenKey);
    await prefs.remove(userIdKey);
    await prefs.remove(userNameKey);
    await prefs.remove(userEmailKey);
  }

  // Check if user is logged in
  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(tokenKey) != null;
  }

  // Get user data
  Future<Map<String, dynamic>> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'userId': prefs.getInt(userIdKey),
      'userName': prefs.getString(userNameKey),
      'userEmail': prefs.getString(userEmailKey),
    };
  }
}
