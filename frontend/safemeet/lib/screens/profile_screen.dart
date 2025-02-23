import 'package:flutter/material.dart';
import 'package:safemeet/services/api_service.dart';


class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ApiService _apiService = ApiService();
  Map<String, dynamic> _user = {};

  @override
  void initState() {
    super.initState();
    _fetchUserProfile();
  }

  Future<void> _fetchUserProfile() async {
    try {
      final users = await _apiService.fetchUsers();
      if (users.isNotEmpty) {
        setState(() {
          _user = users[0];  // Supposons que le premier utilisateur est l'utilisateur actuel
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profil')),
      body: _user.isEmpty
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Nom d\'utilisateur: ${_user['username']}'),
                  Text('Email: ${_user['email']}'),
                  Text('Téléphone: ${_user['phone_number']}'),
                ],
              ),
            ),
    );
  }
}