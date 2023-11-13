import 'package:flutter/material.dart';
import 'package:login_project/constant.dart';

class CariKaryawanPage extends StatefulWidget {
  static String routeName = "/searchkaryawan";
  const CariKaryawanPage({Key? key}) : super(key: key);

  @override
  _CariKaryawanPageState createState() => _CariKaryawanPageState();
}

class _CariKaryawanPageState extends State<CariKaryawanPage> {
  TextEditingController _searchController = TextEditingController();
  List<String> _karyawanList = [
    'Nama Karyawan 1',
    'Nama Karyawan 2',
    'Nama Karyawan 3',
    'alvin',
    'almaas',
    'amalia',
    'aji',
    // ... tambahkan nama karyawan lainnya
  ];

  List<String> _filteredKaryawanList = [];

  @override
  void initState() {
    super.initState();
    _filteredKaryawanList = _karyawanList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cari Karyawan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildSearchBar(),
            SizedBox(height: 20),
            buildKaryawanList(),
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

  Widget buildSearchBar() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.search),
          ),
          Expanded(
            child: TextField(
              controller: _searchController,
              onChanged: (value) {
                filterKaryawanList(value);
              },
              decoration: InputDecoration(
                hintText: 'Cari Karyawan...',
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildKaryawanList() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: _filteredKaryawanList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(_filteredKaryawanList[index]),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  // Tampilkan dialog konfirmasi penghapusan
                  showDeleteConfirmationDialog();
                },
              ),
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  // Navigasi ke halaman edit data karyawan
                  // Implementasi navigasi ke halaman EditDataKaryawan
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void showDeleteConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Konfirmasi Hapus'),
          content: Text('Yakin ingin menghapus karyawan ini?'),
          actions: [
            TextButton(
              onPressed: () {
                // Proses penghapusan jika user yakin
                // Implementasi penghapusan data karyawan
                deleteKaryawan(); // Panggil fungsi untuk menghapus data karyawan
                Navigator.of(context).pop();
              },
              child: Text('Yakin'),
            ),
            TextButton(
              onPressed: () {
                // Batal penghapusan jika user tidak yakin
                Navigator.of(context).pop();
              },
              child: Text('Batal'),
            ),
          ],
        );
      },
    );
  }

  void deleteKaryawan() {
    // Implementasi penghapusan data karyawan
    // Misalnya, Anda memiliki list _karyawanList, dan Anda ingin menghapus karyawan tertentu
    // Anda bisa menggunakan index atau data tertentu untuk menentukan karyawan yang akan dihapus
    // Contoh menghapus karyawan berdasarkan index:
    // _karyawanList.removeAt(index);

    // Setelah menghapus, Anda perlu memperbarui tampilan daftar karyawan
    // Contoh:
    // setState(() {
    //   _filteredKaryawanList = _karyawanList;
    // });
  }

  void filterKaryawanList(String query) {
    query = query.toLowerCase();
    setState(() {
      _filteredKaryawanList = _karyawanList
          .where((karyawan) => karyawan.toLowerCase().contains(query))
          .toList();
    });
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
