import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wecareapps/pages/form_details.dart';
import 'package:wecareapps/providers/form_state_provider.dart';
import 'package:wecareapps/pages/appointment_form.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formState = Provider.of<FormStateProvider>(context);

    return Scaffold(
      body: formState.forms.isEmpty
          ? const Center(
              child: Text(
                'No appointments yet.',
                style: TextStyle(fontSize: 16),
              ),
            )
          : ListView.builder(
              itemCount: formState.forms.length,
              itemBuilder: (context, index) {
                final form = formState.forms[index];
                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    title: Text(form.childName),
                    subtitle: Text(
                        '${form.selectedDate.toLocal().toString().split(' ')[0]} - ${form.selectedTime}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.info, color: Colors.blue),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => FormDetailsPage(
                                  parentName: form.parentName,
                                  childName: form.childName,
                                  selectedDate: form.selectedDate,
                                  selectedTime: form.selectedTime,
                                  description: form.description,
                                ),
                              ),
                            );
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            formState.deleteForm(index);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.greenAccent,
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AppointmentForm()),
          );
        },
      ),
    );
  }
}
