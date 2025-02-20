import 'package:flutter/material.dart';

class AgentCreateUserScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  // Controllers to get input values
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController prevRendezvousController =
      TextEditingController();
  final TextEditingController upcomingRendezvousController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Civilian User'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: fullNameController,
                  decoration: const InputDecoration(labelText: 'Full Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a full name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: ageController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Age'),
                  validator: (value) {
                    if (value == null || int.tryParse(value) == null) {
                      return 'Please enter a valid age';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: locationController,
                  decoration:
                      const InputDecoration(labelText: 'Location of Residence'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a location';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: prevRendezvousController,
                  decoration:
                      const InputDecoration(labelText: 'Previous Rendezvous'),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: upcomingRendezvousController,
                  decoration:
                      const InputDecoration(labelText: 'Upcoming Rendezvous'),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Simulate user creation
                      print('User Created:');
                      print('Full Name: ${fullNameController.text}');
                      print('Age: ${ageController.text}');
                      print('Location: ${locationController.text}');
                      print(
                          'Previous Rendezvous: ${prevRendezvousController.text}');
                      print(
                          'Upcoming Rendezvous: ${upcomingRendezvousController.text}');
                    }
                  },
                  child: const Text('Create User'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
