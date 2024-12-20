import 'package:flutter/material.dart';

class HomeScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Location",
              style: TextStyle(fontSize: 15, color: Colors.black),
            ),
            Text(
              "Pokhara",
              style: TextStyle(fontSize: 20, color: Colors.blue, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Date, Guests, and Search Bar
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "24 OCT - 26 OCT",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue),
                      ),
                      Text("3 guests", style: TextStyle(color: Colors.blue)),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            // Search Bar
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "Search Hotel By Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.blue),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            SizedBox(height: 16),
            // Recommended Hotels Section
            Text(
              "Recommended Hotels",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
            ),
            SizedBox(height: 8),
            // Use Expanded to prevent overflow in ListView
            SizedBox(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  HotelCard(
                    imagePath: 'assets/images/hotel1.jpg',
                    name: 'AYANA Resort',
                    location: 'Pokhara',

                  ),
                  SizedBox(width: 10),
                  HotelCard(
                    imagePath: 'assets/images/hotel2.png',
                    name: 'COMO Uma Resort',
                    location: 'Pokhara',

                  ),
                  SizedBox(width: 10),
                  HotelCard(
                    imagePath: 'assets/images/hotel3.png',
                    name: 'Ritz-Carlton',
                    location: 'Pokhara',

                  ),
                ],
              ),
            ),
            SizedBox(height: 13),
            // Business Accommodations Section (Explore More)
            Text(
              "Explore More",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
            ),
            SizedBox(height: 8),
            // Use Expanded to prevent overflow in ListView
            SizedBox(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  HotelCard(
                    imagePath: 'assets/images/hotel4.jpeg',
                    name: 'Intercontinental',
                    location: 'Pokhara',

                  ),
                  SizedBox(width: 10),
                  HotelCard(
                    imagePath: 'assets/images/hotel1.jpg',
                    name: 'Hilton Garden Inn',
                    location: 'Pokhara',

                  ),
                  SizedBox(width: 10),
                  HotelCard(
                    imagePath: 'assets/images/hotel3.png',
                    name: 'Sheraton',
                    location: 'Pokhara',

                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HotelCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final String location;


  const HotelCard({
    required this.imagePath,
    required this.name,
    required this.location,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imagePath,
              height: 120,
              width: 160,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 8),
          Text(
            name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4),
          Text(
            location,
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(height: 4),

        ],
      ),
    );
  }
}
