import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart'; // Import the carousel_slider package

class HomeScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Align(
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Location",
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
              Text(
                "Pokhara",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
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
        child: LayoutBuilder(
          builder: (context, constraints) {
            bool isTablet = constraints.maxWidth > 600; // Check for tablet

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "24 OCT - 26 OCT",
                            style: TextStyle(
                                fontSize: isTablet ? 18 : 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          ),
                          Text("3 guests",
                              style: TextStyle(color: Colors.blue)),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: "Search Hotel By Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Color(0xFF007EF2)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(color: Color(0xFF007EF2), width: 2),
                    ),
                    filled: false,
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  "Recommended Hotels",
                  style: TextStyle(
                      fontSize: isTablet ? 22 : 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
                SizedBox(height: 8),
                SizedBox(
                  height: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      HotelCard(
                        imagePath: 'assets/images/hotel1.jpg',
                        name: 'AYANA Resort',
                        location: 'Pokhara',
                        description:
                            'AYANA Resort offers luxurious stays with lake views and premium services.',
                        roomStatus: 'Available',
                        roomImages: [
                          'assets/images/room1.jpeg',
                          'assets/images/room2.jpeg',
                          'assets/images/ro1.webp'
                        ], // Room images for carousel
                        pricePerNight: '\$150',
                      ),
                      SizedBox(width: 10),
                      HotelCard(
                        imagePath: 'assets/images/hotel2.png',
                        name: 'COMO Uma Resort',
                        location: 'Pokhara',
                        description:
                            'COMO Uma Resort provides a perfect blend of modern comfort and nature.',
                        roomStatus: 'Not Available',
                        roomImages: [
                          'assets/images/room1.jpeg',
                          'assets/images/room2.jpeg',
                           'assets/images/ro1.webp'
                        ], // Room images for carousel
                        pricePerNight: '\$120',
                      ),
                      SizedBox(width: 10),
                      HotelCard(
                        imagePath: 'assets/images/hotel3.png',
                        name: 'Ritz-Carlton',
                        location: 'Pokhara',
                        description:
                            'Ritz-Carlton is known for its premium hospitality and scenic surroundings.',
                        roomStatus: 'Available',
                        roomImages: [
                          'assets/images/room1.jpeg',
                          'assets/images/room2.jpeg',
                           'assets/images/ro1.webp'
                        ], // Room images for carousel
                        pricePerNight: '\$250',
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 13),
                Text(
                  "Explore More",
                  style: TextStyle(
                      fontSize: isTablet ? 22 : 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
                SizedBox(height: 8),
                SizedBox(
                  height: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      HotelCard(
                        imagePath: 'assets/images/hotel4.jpeg',
                        name: 'Intercontinental',
                        location: 'Pokhara',
                        description:
                            'Intercontinental hotel provides an elegant stay with world-class facilities.',
                        roomStatus: 'Available',
                        roomImages: [
                          'assets/images/room1.jpeg',
                          'assets/images/room2.jpeg',
                           'assets/images/ro1.webp'
                        ], // Room images for carousel
                        pricePerNight: '\$180',
                      ),
                      SizedBox(width: 10),
                      HotelCard(
                        imagePath: 'assets/images/hotel1.jpg',
                        name: 'Hilton Garden Inn',
                        location: 'Pokhara',
                        description:
                            'Hilton Garden Inn is a comfortable and stylish choice for business and leisure.',
                        roomStatus: 'Available',
                        roomImages: [
                          'assets/images/room1.jpeg',
                          'assets/images/room2.jpeg',
                           'assets/images/ro1.webp'
                        ], // Room images for carousel
                        pricePerNight: '\$160',
                      ),
                      SizedBox(width: 10),
                      HotelCard(
                        imagePath: 'assets/images/hotel3.png',
                        name: 'Sheraton',
                        location: 'Pokhara',
                        description:
                            'Sheraton hotel offers an exquisite experience with top-notch hospitality.',
                        roomStatus: 'Not Available',
                        roomImages: [
                          'assets/images/room1.jpeg',
                          'assets/images/room2.jpeg',
                          'assets/images/ro1.webp'
                        ], // Room images for carousel
                        pricePerNight: '\$200',
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class HotelCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final String location;
  final String description;
  final String roomStatus;
  final List<String> roomImages; // List of room images
  final String pricePerNight;

  const HotelCard({
    required this.imagePath,
    required this.name,
    required this.location,
    required this.description,
    required this.roomStatus,
    required this.roomImages, // Accept List of room images
    required this.pricePerNight,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the Hotel Detail Screen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HotelDetailScreen(
              imagePath: imagePath,
              name: name,
              location: location,
              description: description,
              roomStatus: roomStatus,
              roomImages: roomImages, // Pass room images to HotelDetailScreen
              pricePerNight: pricePerNight,
            ),
          ),
        );
      },
      child: Container(
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
          ],
        ),
      ),
    );
  }
}

class HotelDetailScreen extends StatelessWidget {
  final String imagePath;
  final String name;
  final String location;
  final String description;
  final String roomStatus;
  final List<String> roomImages; // List of room images for carousel
  final String pricePerNight;

  const HotelDetailScreen({
    required this.imagePath,
    required this.name,
    required this.location,
    required this.description,
    required this.roomStatus,
    required this.roomImages, // Accept List of room images
    required this.pricePerNight,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        backgroundColor: Colors.blue,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isTablet = constraints.maxWidth > 600; // Check for tablet

          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      imagePath,
                      width: double.infinity,
                      height: isTablet ? 300 : 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    name,
                    style: TextStyle(
                        fontSize: isTablet ? 24 : 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    location,
                    style: TextStyle(
                        fontSize: isTablet ? 20 : 16, color: Colors.grey),
                  ),
                  SizedBox(height: 12),
                  Text(
                    description,
                    style: TextStyle(fontSize: isTablet ? 18 : 16),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Room Status: $roomStatus",
                    style: TextStyle(fontSize: isTablet ? 18 : 16),
                  ),
                  SizedBox(height: 16),

                  // Room Images Carousel
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 200,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.8,
                    ),
                    items: roomImages.map((image) {
                      return Builder(
                        builder: (BuildContext context) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              image,
                              width: double.infinity,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),

                  SizedBox(height: 8),
                  Text(
                    "Price per Night: $pricePerNight",
                    style: TextStyle(fontSize: isTablet ? 18 : 16),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      minimumSize: Size(double.infinity, 50),
                    ),
                    child: Text("Book Now"),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeScreenView(),
  ));
}
