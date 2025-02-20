import 'package:flutter/material.dart';
import 'screens/create_user.dart';
// import 'screens/map_screen.dart';

void main() {
  runApp(const EpidemicTrackerApp());
}

class EpidemicTrackerApp extends StatelessWidget {
  const EpidemicTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Epidemic Tracker',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(),
      routes: {
        '/create-user': (context) => AgentCreateUserScreen(),
        // '/map': (context) => MapScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Epidemic Tracker')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/create-user');
          },
          child: const Text('Go to Create User Form'),
        ),
      ),
    );
  }
}
