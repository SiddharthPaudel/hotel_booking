import 'package:flutter/material.dart';

class BookingsView extends StatelessWidget {
  // Sample data for the bookings
  final List<Map<String, String>> bookings = [
    {
      'email': 'john.doe@example.com',
      'checkIn': '2025-02-01',
      'checkOut': '2025-02-05',
      'paymentStatus': 'Paid',
    },
    {
      'email': 'jane.smith@example.com',
      'checkIn': '2025-02-03',
      'checkOut': '2025-02-07',
      'paymentStatus': 'Pending',
    },
    {
      'email': 'mary.jones@example.com',
      'checkIn': '2025-02-10',
      'checkOut': '2025-02-15',
      'paymentStatus': 'Paid',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bookings View")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: const [
              DataColumn(label: Text('Customer Email')),
              DataColumn(label: Text('Check-in Date')),
              DataColumn(label: Text('Check-out Date')),
              DataColumn(label: Text('Payment Status')),
            ],
            rows: bookings.map((booking) {
              return DataRow(
                cells: [
                  DataCell(Text(booking['email'] ?? '')),
                  DataCell(Text(booking['checkIn'] ?? '')),
                  DataCell(Text(booking['checkOut'] ?? '')),
                  DataCell(Text(booking['paymentStatus'] ?? '')),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
