import 'package:flutter/material.dart';
import 'package:safemeet/services/api_service.dart';


class ScheduleAppointmentScreen extends StatefulWidget {
  @override
  _ScheduleAppointmentScreenState createState() => _ScheduleAppointmentScreenState();
}

class _ScheduleAppointmentScreenState extends State<ScheduleAppointmentScreen> {
  final ApiService _apiService = ApiService();
  final _formKey = GlobalKey<FormState>();
  final _vaccineController = TextEditingController();
  final _dateController = TextEditingController();

  Future<void> _scheduleAppointment() async {
    if (_formKey.currentState!.validate()) {
      final appointmentData = {
        'vaccine': _vaccineController.text,
        'date': _dateController.text,
      };

      try {
        await _apiService.createAppointment(appointmentData);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Rendez-vous pris avec succès !')),
        );
        Navigator.pop(context);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erreur: $e')),
        );
      }
    }
  }

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
                onPressed: _scheduleAppointment,
                child: Text('Confirmer'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}