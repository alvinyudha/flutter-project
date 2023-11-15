import 'package:flutter/material.dart';
import 'package:login_project/components/TambahKaryawan/AddKaryawan.dart';
import 'package:login_project/constant.dart';
import 'package:get/get.dart';

class DashboardPage extends StatelessWidget {
  final int totalKaryawan;
  final int karyawanCuti;

  // Konstruktor untuk menerima data
  const DashboardPage(
      {Key? key, required this.totalKaryawan, required this.karyawanCuti})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Jumlah Total Karyawan: $totalKaryawan',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Jumlah Karyawan Cuti: $karyawanCuti',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          buildBottomNavigationBarItem(
            icon: Icons.home,
            label: 'Dashboard',
          ),
          buildBottomNavigationBarItem(
            icon: Icons.person_add,
            label: 'Tambah Karyawan',
          ),
          buildBottomNavigationBarItem(
            icon: Icons.search,
            label: 'Cari Karyawan',
          ),
          buildBottomNavigationBarItem(
            icon: Icons.people,
            label: 'Data Karyawan',
          ),
        ],
        onTap: (index) {
          // Tindakan ketika item navigasi bawah diklik
          switch (index) {
            case 0:
              // Navigasi ke halaman Dashboard
              break;
            case 1:
              // Navigasi ke halaman Tambah Karyawan
              Get.to(TambahDataKaryawanPage());
              break;
            case 2:
              // Navigasi ke halaman Cari Karyawan
              break;
            case 3:
              // Navigasi ke halaman Data Karyawan
              break;
          }
        },
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
void main() {
  runApp(
    MaterialApp(
      home: DashboardPage(totalKaryawan: 50, karyawanCuti: 5),
    ),
  );
}
