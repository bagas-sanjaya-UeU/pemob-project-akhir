import 'package:flutter/material.dart';

// Halaman Form Order yang berisi form input data order
class FormOrderPage extends StatefulWidget {
  const FormOrderPage({super.key});

  @override
  State<FormOrderPage> createState() => _FormOrderPageState();
}

class _FormOrderPageState extends State<FormOrderPage> {
  // Controllers untuk setiap field input
  final TextEditingController orderNumberController =
      TextEditingController(text: '080091234');
  final TextEditingController employeeController =
      TextEditingController(text: 'Admin');
  final TextEditingController branchCompanyController =
      TextEditingController(text: 'Head Office');
  final TextEditingController clientCompanyController =
      TextEditingController(text: 'PT. Sumber Air Jernih');
  final TextEditingController discountController =
      TextEditingController(text: '10%');
  final TextEditingController statusController =
      TextEditingController(text: 'Sales Order');

  // Fungsi untuk menampilkan slide info
  void _showInfoSheet() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Container(
                  width: 50,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Center(
                child: Text(
                  'DETAILS',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(height: 16),
              _buildDetailRow('Order Number', orderNumberController.text),
              _buildDetailRow('Employee', employeeController.text),
              _buildDetailRow('Branch Company', branchCompanyController.text),
              _buildDetailRow('Client Company', clientCompanyController.text),
              _buildDetailRow('Discount', discountController.text),
              _buildDetailRow('Status', statusController.text),
              SizedBox(height: 24),
              Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Menutup bottom sheet
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text('Close'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

// fungsi untuk membuat baris detail di slide info
  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Text(
            label + ': ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // Mencegah overflow saat keyboard muncul
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Form Order',
          style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold),
        ),
        actions: [
          CircleAvatar(
            backgroundColor: Colors.blueGrey,
            child: Icon(
              Icons.person,
              color: Colors.white,
            ),
          ),
          SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Order Number
            _buildInputField('Order Number', orderNumberController),
            SizedBox(height: 16),

            // Employee
            _buildInputField('Employee', employeeController),
            SizedBox(height: 16),

            // BranchCompany
            _buildInputField('BranchCompany', branchCompanyController),
            SizedBox(height: 16),

            // Client Company
            _buildInputField('Client Company', clientCompanyController),
            SizedBox(height: 16),

            // Discount
            _buildInputField('Discount', discountController),
            SizedBox(height: 16),

            // Status
            _buildInputField('Status', statusController),
            SizedBox(height: 24),

            // Create Button
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: () {
                  _showInfoSheet(); // Menampilkan slide info
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 141, 171, 226),
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text('Create'),
              ),
            ),
          ],
        ),
      ),
    );
  }

// fungsi untuk membuat field input di form
  Widget _buildInputField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
        ),
        SizedBox(height: 8),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[200],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
