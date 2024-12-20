import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wecareapps/providers/form_state_provider.dart'
    hide AppointmentForm;
import 'package:wecareapps/pages/appointment_form.dart'; // Import AppointmentForm from the correct file

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final formState = Provider.of<FormStateProvider>(context);

    return Scaffold(
      body: formState.forms.isEmpty
          ? Center(
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
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    title: Text(form.childName),
                    subtitle: Text(
                        '${form.selectedDate.toLocal().toString().split(' ')[0]} - ${form.selectedTime}'),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        formState.deleteForm(index);
                      },
                    ),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: Text('Appointment Details'),
                          content: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Parent Name: ${form.parentName}'),
                                Text('Child Name: ${form.childName}'),
                                Text(
                                    'Date: ${form.selectedDate.toLocal().toString().split(' ')[0]}'),
                                Text('Time: ${form.selectedTime}'),
                                Text('Description: ${form.description}'),
                              ],
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text('Close'),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.greenAccent,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => AppointmentForm()),
          );
        },
      ),
    );
  }
}
