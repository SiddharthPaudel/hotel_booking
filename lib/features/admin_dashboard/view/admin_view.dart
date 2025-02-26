import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AdminDashboard extends StatefulWidget {
  @override
  _AdminDashboardState createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Admin Dashboard")),
      drawer: ResponsiveDrawer(onItemTapped: _onItemTapped),
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isTablet = constraints.maxWidth > 600;

          return Row(
            children: [
              if (isTablet)
                ResponsiveSidebar(
                  selectedIndex: _selectedIndex,
                  onItemTapped: _onItemTapped,
                ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: _getView(_selectedIndex),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _getView(int index) {
    switch (index) {
      case 0:
        return const DashboardContent();
      case 1:
        return const CustomerView();
      case 2:
        return BookingsView();
      case 3:
        return HotelsView();
      case 4:
        return HotelDetailsForm(); // Show hotel form when clicked
      default:
        return const DashboardContent();
    }
  }
}

// Modern Responsive Sidebar

class ResponsiveSidebar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const ResponsiveSidebar({
    required this.selectedIndex,
    required this.onItemTapped,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      decoration: BoxDecoration(
        color: Colors.blueGrey[900],
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 20),
          const Icon(Icons.admin_panel_settings, size: 50, color: Colors.white),
          const SizedBox(height: 20),
          ...["Dashboard", "Customers", "Bookings", "Hotels", "Hotel Details"]
              .asMap()
              .entries
              .map((entry) {
            int idx = entry.key;
            String label = entry.value;
            return ListTile(
              leading: Icon(
                idx == 0
                    ? Icons.dashboard
                    : idx == 1
                        ? Icons.person
                        : idx == 2
                            ? Icons.book
                            : idx == 3
                                ? Icons.hotel
                                : Icons.add_a_photo, // For hotel details
                color: selectedIndex == idx ? Colors.blue : Colors.white,
              ),
              title: Text(label, style: const TextStyle(color: Colors.white)),
              selected: selectedIndex == idx,
              selectedTileColor: Colors.blue[700],
              onTap: () {
                onItemTapped(idx);
              },
            );
          }).toList(),
        ],
      ),
    );
  }
}

// Drawer for Mobile View
// Drawer for Mobile View
class ResponsiveDrawer extends StatelessWidget {
  final Function(int) onItemTapped;

  const ResponsiveDrawer({required this.onItemTapped, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blueGrey),
            child: Center(
              child: Text("Admin Menu",
                  style: TextStyle(color: Colors.white, fontSize: 20)),
            ),
          ),
          ...[
            "Dashboard",
            "Customers",
            "Bookings",
            "Hotels",
            "Hotel Details"
          ] // Added "Hotel Details"
              .asMap()
              .entries
              .map((entry) {
            int idx = entry.key;
            String label = entry.value;
            return ListTile(
              leading: Icon(
                idx == 0
                    ? Icons.dashboard
                    : idx == 1
                        ? Icons.person
                        : idx == 2
                            ? Icons.book
                            : idx == 3
                                ? Icons.hotel
                                : Icons.add_a_photo, // For "Hotel Details"
                color: Colors.blueGrey,
              ),
              title: Text(label),
              onTap: () {
                onItemTapped(idx);
                Navigator.pop(context); // Close the drawer
              },
            );
          }).toList(),
        ],
      ),
    );
  }
}

// Updated Dashboard Content
class DashboardContent extends StatelessWidget {
  const DashboardContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Admin Dashboard",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),

        // Updated Row for Stats Cards
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const DashboardStatCard(
                title: 'Total Customers', value: '150', color: Colors.blue),
            const DashboardStatCard(
                title: 'Total Bookings', value: '120', color: Colors.green),
            const DashboardStatCard(
                title: 'Available Hotels', value: '30', color: Colors.orange),
          ],
        ),
      ],
    );
  }
}

// Dashboard Stat Card
class DashboardStatCard extends StatelessWidget {
  final String title;
  final String value;
  final Color color;

  const DashboardStatCard(
      {Key? key, required this.title, required this.value, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                value,
                style: TextStyle(
                    fontSize: 24, fontWeight: FontWeight.bold, color: color),
              ),
              const SizedBox(height: 4),
              Text(title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      ),
    );
  }
}

// Updated Customer View
class CustomerView extends StatelessWidget {
  const CustomerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isTablet = screenWidth > 600;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Customers",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),

          // Responsive layout
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DataTable(
                  columnSpacing:
                      isTablet ? 32.0 : 16.0, // Adjust column spacing
                  border: TableBorder.all(color: Colors.grey[300]!),
                  columns: const [
                    DataColumn(
                        label: Text('Email',
                            style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text('Username',
                            style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text('Actions',
                            style: TextStyle(fontWeight: FontWeight.bold))),
                  ],
                  rows: _buildCustomerRows(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<DataRow> _buildCustomerRows() {
    List<Map<String, String>> customers = [
      {
        "email": "alice@example.com",
        "username": "alice_johnson",
      },
      {
        "email": "bob@example.com",
        "username": "bob_smith",
      },
      {
        "email": "charlie@example.com",
        "username": "charlie_brown",
      },
    ];

    return customers.map((customer) {
      return DataRow(
        cells: [
          DataCell(Text(customer["email"]!)),
          DataCell(Text(customer["username"]!)),
          DataCell(
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.blue),
                  onPressed: () {
                    _onEditPressed(customer["email"]!);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    _onDeletePressed(customer["email"]!);
                  },
                ),
              ],
            ),
          ),
        ],
      );
    }).toList();
  }

  void _onEditPressed(String email) {
    print('Edit button pressed for $email');
  }

  void _onDeletePressed(String email) {
    print('Delete button pressed for $email');
  }
}

// Updated Bookings View
class BookingsView extends StatelessWidget {
  final List<Map<String, String>> bookings = [
    {
      'email': 'john.doe@example.com',
      'hotelName': 'Ocean View Hotel',
      'checkIn': '2025-02-01',
      'checkOut': '2025-02-05',
    },
    {
      'email': 'jane.smith@example.com',
      'hotelName': 'Mountain Resort',
      'checkIn': '2025-02-10',
      'checkOut': '2025-02-15',
    },
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isTablet = screenWidth > 600;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Bookings",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DataTable(
                  columnSpacing:
                      isTablet ? 32.0 : 16.0, // Adjust column spacing
                  border: TableBorder.all(color: Colors.grey[300]!),
                  columns: const [
                    DataColumn(
                        label: Text('Email',
                            style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text('Hotel Name',
                            style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text('Check-In',
                            style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text('Check-Out',
                            style: TextStyle(fontWeight: FontWeight.bold))),
                  ],
                  rows: bookings.map((booking) {
                    return DataRow(
                      cells: [
                        DataCell(Text(booking['email']!)),
                        DataCell(Text(booking['hotelName']!)),
                        DataCell(Text(booking['checkIn']!)),
                        DataCell(Text(booking['checkOut']!)),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Updated Hotels View
class HotelsView extends StatelessWidget {
  final List<Map<String, String>> hotels = [
    {
      'name': 'Ocean View Hotel',
      'description': 'A luxurious hotel with a stunning view of the ocean.',
      'price': '\$200 per night',
      'status': 'Available',
    },
    {
      'name': 'Mountain Resort',
      'description': 'A peaceful resort located in the mountains.',
      'price': '\$150 per night',
      'status': 'Available',
    },
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isTablet = screenWidth > 600;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Hotels",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DataTable(
                  columnSpacing:
                      isTablet ? 32.0 : 16.0, // Adjust column spacing
                  border: TableBorder.all(color: Colors.grey[300]!),
                  columns: const [
                    DataColumn(
                        label: Text('Hotel Name',
                            style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text('Description',
                            style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text('Price',
                            style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text('Status',
                            style: TextStyle(fontWeight: FontWeight.bold))),
                  ],
                  rows: hotels.map((hotel) {
                    return DataRow(
                      cells: [
                        DataCell(Text(hotel['name']!)),
                        DataCell(Text(hotel['description']!)),
                        DataCell(Text(hotel['price']!)),
                        DataCell(Text(hotel['status']!)),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HotelDetailsForm extends StatefulWidget {
  const HotelDetailsForm({Key? key}) : super(key: key);

  @override
  _HotelDetailsFormState createState() => _HotelDetailsFormState();
}

class _HotelDetailsFormState extends State<HotelDetailsForm> {
  final _formKey = GlobalKey<FormState>();
  File? _image;
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  String _availability = 'Available';

  // Function to pick image from gallery
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Add Hotel Details",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // Image Picker
            GestureDetector(
              onTap: _pickImage,
              child: Container(
                color: Colors.grey[200],
                width: 150,
                height: 150,
                child: _image == null
                    ? const Icon(Icons.camera_alt, size: 40, color: Colors.grey)
                    : Image.file(_image!, fit: BoxFit.cover),
              ),
            ),
            const SizedBox(height: 16),

            // Description
            TextFormField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                labelText: "Hotel Description",
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter hotel description';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            // Price
            TextFormField(
              controller: _priceController,
              decoration: const InputDecoration(
                labelText: "Price per Night",
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter price';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            // Location
            TextFormField(
              controller: _locationController,
              decoration: const InputDecoration(
                labelText: "Location",
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter location';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            // Availability Dropdown
            DropdownButtonFormField<String>(
              value: _availability,
              onChanged: (value) {
                setState(() {
                  _availability = value!;
                });
              },
              items: ['Available', 'Not Available']
                  .map((e) => DropdownMenuItem<String>(
                        value: e,
                        child: Text(e),
                      ))
                  .toList(),
              decoration: const InputDecoration(
                labelText: "Availability",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // Submit Button
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // Form is valid, submit hotel details
                  // Here, you can process the data or send it to your backend
                  print('Hotel Added!');
                  print('Description: ${_descriptionController.text}');
                  print('Price: ${_priceController.text}');
                  print('Location: ${_locationController.text}');
                  print('Availability: $_availability');
                  // You can save image as well
                  if (_image != null) {
                    print('Image Path: ${_image!.path}');
                  }
                }
              },
              child: const Text('Add Hotel'),
            ),
          ],
        ),
      ),
    );
  }
}
