import 'package:flutter/material.dart';
import 'package:safemeet/services/api_service.dart';


class AppointmentScreen extends StatefulWidget {
  @override
  _AppointmentScreenState createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  final ApiService _apiService = ApiService();
  List<dynamic> _appointments = [];

  @override
  void initState() {
    super.initState();
    _fetchAppointments();
  }

  Future<void> _fetchAppointments() async {
    try {
      final appointments = await _apiService.fetchAppointments();
      setState(() {
        _appointments = appointments;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mes rendez-vous')),
      body: ListView.builder(
        itemCount: _appointments.length,
        itemBuilder: (context, index) {
          final appointment = _appointments[index];
          return ListTile(
            title: Text(appointment['vaccine']['name']),
            subtitle: Text('Date: ${appointment['date']} - Statut: ${appointment['status']}'),
          );
        },
      ),
    );
  }
}