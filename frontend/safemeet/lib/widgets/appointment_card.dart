import 'package:flutter/material.dart';
import '../models/appointment.dart';

class AppointmentCard extends StatelessWidget {
  final Appointment appointment;

  AppointmentCard({required this.appointment});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(appointment.vaccineName),
        subtitle: Text('Date: ${appointment.date.toLocal()}'),
        trailing: Text(appointment.status),
      ),
    );
  }
}