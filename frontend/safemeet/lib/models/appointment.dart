class Appointment {
  final int id;
  final String vaccineName;
  final DateTime date;
  final String status;

  Appointment({
    required this.id,
    required this.vaccineName,
    required this.date,
    required this.status,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      id: json['id'],
      vaccineName: json['vaccine']['name'],
      date: DateTime.parse(json['date']),
      status: json['status'],
    );
  }
}