// import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:latlong2/latlong.dart';

// class MapScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Epidemic Map')),
//       body: FlutterMap(
//         options: MapOptions(
//           center: LatLng(37.7749, -122.4194), // Replace with your city's coordinates
//           zoom: 13.0,
//         ),
//         layers: [
//           TileLayerOptions(
//             urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
//             subdomains: ['a', 'b', 'c'],
//           ),
//         ],
//       ),
//     );
//   }
// }
