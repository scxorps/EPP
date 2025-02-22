import 'package:flutter/material.dart';
import '../models/appointment.dart';
import '../services/api_service.dart';
import '../widgets/appointment_card.dart';

class AppointmentScreen extends StatefulWidget {
  @override
  _AppointmentScreenState createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  late Future<List<Appointment>> futureAppointments;

  @override
  void initState() {
    super.initState();
    futureAppointments = ApiService().fetchAppointments('token');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mes rendez-vous')),
      body: FutureBuilder<List<Appointment>>(
        future: futureAppointments,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erreur: ${snapshot.error}'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return AppointmentCard(appointment: snapshot.data![index]);
              },
            );
          }
        },
      ),
    );
  }
}