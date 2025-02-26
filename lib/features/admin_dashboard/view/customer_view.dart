import 'package:flutter/material.dart';

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
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                width: isTablet
                    ? screenWidth * 0.85
                    : screenWidth, // Adjust width for tablets
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
                            label: Text('ID',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(
                            label: Text('Name',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(
                            label: Text('Email',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(
                            label: Text('Phone',
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
            ),
          ),
        ],
      ),
    );
  }

  List<DataRow> _buildCustomerRows() {
    List<Map<String, String>> customers = [
      {
        "id": "1",
        "name": "Alice Johnson",
        "email": "alice@example.com",
        "phone": "123-456-7890"
      },
      {
        "id": "2",
        "name": "Bob Smith",
        "email": "bob@example.com",
        "phone": "987-654-3210"
      },
      {
        "id": "3",
        "name": "Charlie Brown",
        "email": "charlie@example.com",
        "phone": "555-666-7777"
      },
    ];

    return customers.map((customer) {
      return DataRow(
        cells: [
          DataCell(Text(customer["id"]!)),
          DataCell(Text(customer["name"]!)),
          DataCell(Text(customer["email"]!)),
          DataCell(Text(customer["phone"]!)),
          DataCell(
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.blue),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      );
    }).toList();
  }
}

