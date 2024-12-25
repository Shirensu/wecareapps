import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wecareapps/pages/receipt.dart';
import 'package:wecareapps/providers/form_state_provider.dart';

class AppointmentForm extends StatefulWidget {
  @override
  _AppointmentFormState createState() => _AppointmentFormState();
}

class _AppointmentFormState extends State<AppointmentForm> {
  final _formKey = GlobalKey<FormState>();
  final _parentNameController = TextEditingController();
  final _childNameController = TextEditingController();
  final _descriptionController = TextEditingController();
  DateTime? _selectedDate;
  String? _selectedTime;

  void _pickDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Appointment'),
        backgroundColor: Colors.greenAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _parentNameController,
                decoration: const InputDecoration(labelText: 'Parent Name'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Required' : null,
              ),
              TextFormField(
                controller: _childNameController,
                decoration: const InputDecoration(labelText: 'Child Name'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 16.0),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () => _pickDate(context),
                      icon: const Icon(Icons.calendar_today),
                      label: const Text('Pick a Date'),
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  if (_selectedDate != null)
                    Text(_selectedDate!.toLocal().toString().split(' ')[0]),
                ],
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: ['09:00 - 10:00', '10:00 - 11:00', '14:00 - 15:00']
                    .map(
                      (time) => ChoiceChip(
                        label: Text(time),
                        selected: _selectedTime == time,
                        onSelected: (selected) {
                          setState(() {
                            _selectedTime = selected ? time : null;
                          });
                        },
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate() &&
                      _selectedDate != null &&
                      _selectedTime != null) {
                    final formState =
                        Provider.of<FormStateProvider>(context, listen: false);
                    formState.addForm(
                      parentName: _parentNameController.text,
                      childName: _childNameController.text,
                      selectedDate: _selectedDate!,
                      selectedTime: _selectedTime!,
                      description: _descriptionController.text,
                    );

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ReceiptScreen(
                          date: _selectedDate!,
                          time: _selectedTime!,
                          parentName: _parentNameController.text,
                          childName: _childNameController.text,
                          description: _descriptionController.text,
                        ),
                      ),
                    );
                  }
                },
                child: const Text('Create Appointment'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
