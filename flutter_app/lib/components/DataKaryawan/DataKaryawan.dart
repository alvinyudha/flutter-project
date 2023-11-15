import 'package:flutter/material.dart';
import 'package:login_project/constant.dart';

class DataKaryawanPage extends StatefulWidget {
  static String routeName = "/datakaryawan";
  final Map<String, String> karyawanData;

  const DataKaryawanPage({Key? key, required this.karyawanData})
      : super(key: key);

  @override
  _DataKaryawanPageState createState() => _DataKaryawanPageState();
}

class _DataKaryawanPageState extends State<DataKaryawanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Karyawan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 227, 227, 227),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildDataField('Nama', widget.karyawanData['Nama']),
              buildDataField('NIP', widget.karyawanData['NIP']),
              // Tambahkan field data karyawan lainnya sesuai kebutuhan
              SizedBox(height: 20),
              Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigasi ke halaman Tambah Data Karyawan dengan data yang sama
                    Navigator.pushReplacementNamed(
                      context,
                      '/addkaryawan',
                      arguments: widget.karyawanData,
                    );
                  },
                  child: Text('Edit'),
                ),
              ),
            ],
          ),
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

  Widget buildDataField(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(value ?? '-'),
        ],
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
