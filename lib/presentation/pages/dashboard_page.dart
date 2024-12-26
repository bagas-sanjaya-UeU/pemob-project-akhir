import 'package:flutter/material.dart';
import 'formOrder_page.dart';

// Halaman Dashboard yang menampilkan daftar produk dan form input data order
class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool _showDropdown = false;
  bool isWaterHygienicExpanded = false;
  bool isWasteWaterExpanded = false;

  // Checkbox states
  bool isTurbidityChecked = false;
  bool isPhChecked = false;
  bool isParameterAChecked = false;
  bool isParameterBChecked = false;

  // Fungsi untuk menampilkan atau menyembunyikan dropdown
  void _toggleDropdown() {
    setState(() {
      _showDropdown = !_showDropdown;
    });
  }

// Fungsi untuk logout
  void _logout() {
    // Tambahkan logika logout di sini
    Navigator.pushReplacementNamed(context, '/login');
  }

  // Fungsi untuk navigasi ke halaman Form Order
  void _navigateToNextPageOrder() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FormOrderPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Product List',
          style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold),
        ),
        actions: [
          GestureDetector(
            onTap: _toggleDropdown,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: Colors.blueGrey,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Water Hygienic Item
                Row(
                  children: [
                    Icon(Icons.water_drop, color: Colors.blue, size: 40),
                    SizedBox(width: 10),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isWaterHygienicExpanded = !isWaterHygienicExpanded;
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Water Higienis',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Icon(
                              isWaterHygienicExpanded
                                  ? Icons.keyboard_arrow_up
                                  : Icons.keyboard_arrow_down,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                if (isWaterHygienicExpanded)
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0, top: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: isTurbidityChecked,
                              onChanged: (val) {
                                setState(() {
                                  isTurbidityChecked = val!;
                                });
                              },
                            ),
                            Text('Kekeruhan'),
                          ],
                        ),
                        Row(
                          children: [
                            Checkbox(
                              value: isPhChecked,
                              onChanged: (val) {
                                setState(() {
                                  isPhChecked = val!;
                                });
                              },
                            ),
                            Text('Ph'),
                          ],
                        ),
                      ],
                    ),
                  ),
                Divider(),

                // Waste Water Item
                Row(
                  children: [
                    Icon(Icons.factory, color: Colors.green, size: 40),
                    SizedBox(width: 10),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isWasteWaterExpanded = !isWasteWaterExpanded;
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Air Limbah PI',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Icon(
                              isWasteWaterExpanded
                                  ? Icons.keyboard_arrow_up
                                  : Icons.keyboard_arrow_down,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                if (isWasteWaterExpanded)
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0, top: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: isParameterAChecked,
                              onChanged: (val) {
                                setState(() {
                                  isParameterAChecked = val!;
                                });
                              },
                            ),
                            Text('Parameter A'),
                          ],
                        ),
                        Row(
                          children: [
                            Checkbox(
                              value: isParameterBChecked,
                              onChanged: (val) {
                                setState(() {
                                  isParameterBChecked = val!;
                                });
                              },
                            ),
                            Text('Parameter B'),
                          ],
                        ),
                      ],
                    ),
                  ),
                Divider(),

                // Tombol Next
                Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                    onPressed: () {
                      // Tambahkan logika untuk tombol Next

                      _navigateToNextPageOrder();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 141, 174, 224),
                      padding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text('Next'),
                  ),
                ),
              ],
            ),
          ),
          // Dropdown
          if (_showDropdown)
            Positioned(
              top: kToolbarHeight + 10,
              right: 10,
              child: Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  width: 150,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '@name',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      Divider(),
                      GestureDetector(
                        onTap: _logout,
                        child: Row(
                          children: [
                            Text(
                              'Logout',
                              style: TextStyle(color: Colors.red),
                            ),
                            Spacer(),
                            Icon(
                              Icons.logout,
                              color: Colors.red,
                              size: 18,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
