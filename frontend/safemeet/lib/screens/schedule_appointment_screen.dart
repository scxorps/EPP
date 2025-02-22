import 'package:flutter/material.dart';
import '../services/api_service.dart';

class ScheduleAppointmentScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _vaccineController = TextEditingController();
  final _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Prendre un rendez-vous')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _vaccineController,
                decoration: InputDecoration(labelText: 'Vaccin'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer le nom du vaccin';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _dateController,
                decoration: InputDecoration(labelText: 'Date (YYYY-MM-DD)'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer la date';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ApiService().scheduleAppointment(
                      {
                        'vaccine': _vaccineController.text,
                        'date': _dateController.text,
                      },
                      'token',
                    );
                    Navigator.pop(context);
                  }
                },
                child: Text('Confirmer'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}