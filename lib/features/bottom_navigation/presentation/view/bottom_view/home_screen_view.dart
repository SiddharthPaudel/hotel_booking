import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:intl/intl.dart'; // Import the carousel_slider package

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
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BookingScreen(
                            hotelName: name,
                            pricePerNight: pricePerNight,
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      minimumSize: Size(double.infinity, 50),
                    ),
                    child: Text("Book Now"),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class BookingScreen extends StatefulWidget {
  final String hotelName;
  final String pricePerNight;

  const BookingScreen({
    required this.hotelName,
    required this.pricePerNight,
    Key? key,
  }) : super(key: key);

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  DateTime? checkInDate;
  DateTime? checkOutDate;
  int selectedRooms = 1;

  Future<void> _selectDate(BuildContext context, bool isCheckIn) async {
    DateTime today = DateTime.now();
    DateTime firstDate = isCheckIn ? today : (checkInDate ?? today);
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: firstDate,
      firstDate: firstDate,
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.blueAccent,
            colorScheme: ColorScheme.light(primary: Colors.blueAccent),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      setState(() {
        if (isCheckIn) {
          checkInDate = pickedDate;
          checkOutDate = null;
        } else {
          checkOutDate = pickedDate;
        }
      });
    }
  }

  double calculateTotalPrice() {
    if (checkInDate == null || checkOutDate == null) return 0;
    int nights = checkOutDate!.difference(checkInDate!).inDays;
    double price = double.parse(widget.pricePerNight.substring(1));
    return nights * price * selectedRooms;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200], // Light grey background
      appBar: AppBar(
        title: Text("Book ${widget.hotelName}"),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Card(
            elevation: 4,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Hotel Name
                  Text(
                    widget.hotelName,
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                  ),
                  SizedBox(height: 10),

                  // Price per night
                  Text(
                    "Price per Night: ${widget.pricePerNight}",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 20),

                  // Check-in Date Selection
                  _buildDateSelector("Check-in Date", checkInDate,
                      () => _selectDate(context, true)),
                  SizedBox(height: 16),

                  // Check-out Date Selection
                  _buildDateSelector(
                      "Check-out Date",
                      checkOutDate,
                      checkInDate == null
                          ? null
                          : () => _selectDate(context, false)),
                  SizedBox(height: 20),

                  // Room Selection
                  Text("Select Number of Rooms",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                  SizedBox(height: 8),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: DropdownButton<int>(
                      value: selectedRooms,
                      isExpanded: true,
                      underline: SizedBox(),
                      items: List.generate(5, (index) => index + 1)
                          .map((room) => DropdownMenuItem(
                                value: room,
                                child: Text("$room Room${room > 1 ? 's' : ''}",
                                    style: TextStyle(fontSize: 16)),
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedRooms = value!;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 20),

                  // Total Price Display
                  if (checkInDate != null && checkOutDate != null)
                    Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.green),
                      ),
                      child: Center(
                        child: Text(
                          "Total Price: \$${calculateTotalPrice().toStringAsFixed(2)}",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.green),
                        ),
                      ),
                    ),

                  SizedBox(height: 20),

                  // Confirm Booking Button
                  ElevatedButton(
                    onPressed: (checkInDate != null && checkOutDate != null)
                        ? () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Row(
                                  children: [
                                    Icon(Icons.check_circle,
                                        color: Colors.white),
                                    SizedBox(width: 10),
                                    Text(
                                      "Booking Confirmed!",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                backgroundColor:
                                    Colors.green, // ✅ Green success color
                                behavior: SnackBarBehavior.floating,
                                duration: Duration(
                                    seconds:
                                        2), // Message disappears after 2 seconds
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            );
                          }
                        : null,
                    child:
                        Text("Confirm Booking", style: TextStyle(fontSize: 18)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      foregroundColor: Colors.white,
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 3,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Widget to build Date Picker Buttons
  Widget _buildDateSelector(
      String title, DateTime? date, VoidCallback? onPressed) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        SizedBox(height: 8),
        ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor:
                date != null ? Colors.blueAccent : Colors.grey.shade300,
            foregroundColor: date != null ? Colors.white : Colors.black54,
            minimumSize: Size(double.infinity, 50),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 2,
          ),
          child: Text(
            date == null
                ? "Select Date"
                : DateFormat('dd/MM/yyyy').format(date),
            style: TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeScreenView(),
  ));
}
