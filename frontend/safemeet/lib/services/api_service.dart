import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  static const String baseUrl = 'http://127.0.0.1:8000/api';

  Future<Map<String, String>> _getHeaders() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    return {
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };
  }

  Future<void> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/token/'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'username': username, 'password': password}),
    );

    if (response.statusCode == 200) {
      final token = jsonDecode(response.body)['access'];
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token);
    } else {
      throw Exception('Erreur ${response.statusCode}: ${response.body}');
    }
  }

  Future<void> register(Map<String, dynamic> userData) async {
    final response = await http.post(
      Uri.parse('$baseUrl/users/'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(userData),
    );

    if (response.statusCode != 201) {
      throw Exception('Erreur ${response.statusCode}: ${response.body}');
    }
  }

  Future<List<dynamic>> fetchAppointments() async {
    final headers = await _getHeaders();
    final response = await http.get(Uri.parse('$baseUrl/appointments/'), headers: headers);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Erreur ${response.statusCode}: ${response.body}');
    }
  }

  Future<void> createAppointment(Map<String, dynamic> appointmentData) async {
    final headers = await _getHeaders();
    final response = await http.post(
      Uri.parse('$baseUrl/appointments/'),
      headers: headers,
      body: jsonEncode(appointmentData),
    );

    if (response.statusCode != 201) {
      throw Exception('Erreur ${response.statusCode}: ${response.body}');
    }
  }

  Future<List<dynamic>> fetchUsers() async {
    final headers = await _getHeaders();
    final response = await http.get(Uri.parse('$baseUrl/users/'), headers: headers);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Erreur ${response.statusCode}: ${response.body}');
    }
  }
}