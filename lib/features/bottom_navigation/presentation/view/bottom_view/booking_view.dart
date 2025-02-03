import 'package:flutter/material.dart';

class BookingView extends StatelessWidget {
  const BookingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking Confirmation'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hotel details section
            Text('Hotel Details',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            HotelCard(),
            SizedBox(height: 16),

            // Booking Summary
            Text('Booking Summary',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            BookingSummary(),
            SizedBox(height: 16),

            // Confirmation Message
            Text(
              'Your booking is confirmed!',
              style: TextStyle(fontSize: 16, color: Colors.green),
            ),
            SizedBox(height: 8),

            // Booking Action Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text('View Booking'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Cancel Booking'),
                ),
              ],
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {},
              child: Text('Go to Payment'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                backgroundColor: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HotelCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: ListTile(
        contentPadding: EdgeInsets.all(12),
        leading: Icon(Icons.hotel, size: 50),
        title: Text('Grand Hotel'),
        subtitle: Text('Location: Downtown, City Center'),
        trailing: Icon(Icons.info),
        onTap: () {
          // Navigate to hotel details page if needed
        },
      ),
    );
  }
}

class BookingSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: ListTile(
        contentPadding: EdgeInsets.all(12),
        title: Text('Room Type: Deluxe Room'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Check-in: 1st March 2025'),
            Text('Check-out: 5th March 2025'),
            Text('Guests: 2 Adults, 1 Child'),
            Text('Price: \$300'),
          ],
        ),
      ),
    );
  }
}
