import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/appointment.dart';

class ApiService {
  static const String baseUrl = 'https://api.semep-vaccination.com';

  Future<List<Appointment>> fetchAppointments(String token) async {
    final response = await http.get(
      Uri.parse('$baseUrl/appointments/'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Appointment.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load appointments');
    }
  }

  Future<void> scheduleAppointment(Map<String, dynamic> data, String token) async {
    final response = await http.post(
      Uri.parse('$baseUrl/appointments/'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to schedule appointment');
    }
  }
}