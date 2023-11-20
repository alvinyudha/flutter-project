import 'package:flutter/material.dart';
import 'package:login_project/utilities/constant.dart';

class DashboardPage extends StatelessWidget {
  // Konstruktor untuk menerima data
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        backgroundColor: Colors.transparent,
        toolbarHeight: 76,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              gradient: LinearGradient(
                  colors: [kPrimaryColor, kSecondaryColor],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Jumlah Total Karyawan: 19',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Jumlah Karyawan Cuti: 5',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem buildBottomNavigationBarItem({
    required IconData icon,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      backgroundColor: kPrimaryColor,
      label: label,
    );
  }
}

// Contoh penggunaan widget di MaterialApp
