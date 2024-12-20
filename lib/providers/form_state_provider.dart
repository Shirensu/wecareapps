import 'package:flutter/material.dart';

/// A model representing a single appointment form.
class AppointmentForm {
  final String parentName;
  final String childName;
  final DateTime selectedDate;
  final String selectedTime;
  final String description;

  AppointmentForm({
    required this.parentName,
    required this.childName,
    required this.selectedDate,
    required this.selectedTime,
    required this.description,
  });
}

class FormStateProvider with ChangeNotifier {
  /// List of all created appointment forms.
  final List<AppointmentForm> _forms = [];

  /// Getter to access the list of forms.
  List<AppointmentForm> get forms => List.unmodifiable(_forms);

  /// Adds a new appointment form to the list.
  void addForm({
    required String parentName,
    required String childName,
    required DateTime selectedDate,
    required String selectedTime,
    required String description,
  }) {
    final newForm = AppointmentForm(
      parentName: parentName,
      childName: childName,
      selectedDate: selectedDate,
      selectedTime: selectedTime,
      description: description,
    );
    _forms.add(newForm);
    notifyListeners(); // Notify listeners to update UI.
  }

  /// Deletes a specific form from the list.
  void deleteForm(int index) {
    if (index >= 0 && index < _forms.length) {
      _forms.removeAt(index);
      notifyListeners(); // Notify listeners to update UI.
    }
  }
}
