import 'package:flutter/material.dart';
import 'package:wecareapps/models/user.dart';
import 'package:wecareapps/services/api_service.dart';

// Define the AppointmentForm model class
class AppointmentFormModel {
  final String parentName;
  final String childName;
  final DateTime selectedDate;
  final String selectedTime;
  final String description;

  AppointmentFormModel({
    required this.parentName,
    required this.childName,
    required this.selectedDate,
    required this.selectedTime,
    required this.description,
  });
}

class FormStateProvider extends ChangeNotifier {
  // Authentication related properties
  User? _currentUser;
  bool _isLoading = false;
  String? _error;
  final ApiService _apiService = ApiService();

  // Appointment form related properties
  final List<AppointmentFormModel> _forms = [];

  // Getters
  User? get currentUser => _currentUser;
  bool get isLoading => _isLoading;
  String? get error => _error;
  bool get isLoggedIn => _currentUser != null;
  List<AppointmentFormModel> get forms => _forms;

  FormStateProvider() {
    _checkLoginStatus();
  }

  // Authentication methods
  Future<void> _checkLoginStatus() async {
    _isLoading = true;
    notifyListeners();

    try {
      final isLoggedIn = await _apiService.isLoggedIn();
      if (isLoggedIn) {
        final userData = await _apiService.getUserData();
        _currentUser = User(
          id: userData['userId'],
          username: userData['userName'],
          email: userData['userEmail'],
          token: '', // Token is stored in SharedPreferences
        );
      }
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> login(String email, String password) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final response = await _apiService.login(email, password);

      if (response['ResponseCode'] == 200 &&
          response['Result'] != null &&
          response['Result'].isNotEmpty) {
        final userData = response['Result'][0];
        _currentUser = User(
          id: userData['UserId'],
          username: userData['UserName'],
          email: userData['UserEmail'],
          token: userData['Token'],
        );
        _error = null;
        notifyListeners();
        return true;
      } else {
        _error = response['ResponseMessage'] ?? 'Login failed';
        notifyListeners();
        return false;
      }
    } catch (e) {
      _error = e.toString();
      notifyListeners();
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> register(String username, String email, String password) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final response = await _apiService.register(username, email, password);

      if (response['ResponseCode'] == 200) {
        _error = null;
        notifyListeners();
        return true;
      } else {
        _error = response['ResponseMessage'] ?? 'Registration failed';
        notifyListeners();
        return false;
      }
    } catch (e) {
      _error = e.toString();
      notifyListeners();
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> logout() async {
    _isLoading = true;
    notifyListeners();

    try {
      await _apiService.logout();
      _currentUser = null;
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> changePassword(String oldPassword, String newPassword) async {
    if (_currentUser == null) return false;

    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final response = await _apiService.changePassword(
        _currentUser!.id,
        oldPassword,
        newPassword,
      );

      if (response['ResponseCode'] == 200) {
        _error = null;
        notifyListeners();
        return true;
      } else {
        _error = response['ResponseMessage'] ?? 'Password change failed';
        notifyListeners();
        return false;
      }
    } catch (e) {
      _error = e.toString();
      notifyListeners();
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Appointment form methods
  void addForm({
    required String parentName,
    required String childName,
    required DateTime selectedDate,
    required String selectedTime,
    required String description,
  }) {
    _forms.add(
      AppointmentFormModel(
        parentName: parentName,
        childName: childName,
        selectedDate: selectedDate,
        selectedTime: selectedTime,
        description: description,
      ),
    );
    notifyListeners();
  }

  void deleteForm(int index) {
    if (index >= 0 && index < _forms.length) {
      _forms.removeAt(index);
      notifyListeners();
    }
  }
}
