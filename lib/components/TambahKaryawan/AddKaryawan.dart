import 'package:flutter/material.dart';
import 'package:login_project/constant.dart';

class TambahDataKaryawanPage extends StatefulWidget {
  static String routeName = "/addkaryawan";
  const TambahDataKaryawanPage({Key? key}) : super(key: key);

  @override
  _TambahDataKaryawanPageState createState() => _TambahDataKaryawanPageState();
}

class _TambahDataKaryawanPageState extends State<TambahDataKaryawanPage> {
  final _formKey = GlobalKey<FormState>();

  String? _selectedJenisKelamin;
  TextEditingController _namaController = TextEditingController();
  TextEditingController _nipController = TextEditingController();
  TextEditingController _alamatController = TextEditingController();
  TextEditingController _divisiController = TextEditingController();
  TextEditingController _jabatanController = TextEditingController();
  TextEditingController _tahunMasukController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Data Karyawan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: _namaController,
                  decoration: InputDecoration(labelText: 'Nama'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nama tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _nipController,
                  decoration: InputDecoration(labelText: 'NIP'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'NIP tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                DropdownButtonFormField(
                  value: _selectedJenisKelamin,
                  items: ['Laki-laki', 'Perempuan']
                      .map((jenisKelamin) => DropdownMenuItem(
                            value: jenisKelamin,
                            child: Text(jenisKelamin),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedJenisKelamin = value as String?;
                    });
                  },
                  decoration: InputDecoration(labelText: 'Jenis Kelamin'),
                ),
                TextFormField(
                  controller: _alamatController,
                  decoration: InputDecoration(labelText: 'Alamat'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Alamat tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _divisiController,
                  decoration: InputDecoration(labelText: 'Divisi'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Divisi tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _jabatanController,
                  decoration: InputDecoration(labelText: 'Jabatan'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Jabatan tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _tahunMasukController,
                  decoration: InputDecoration(labelText: 'Tahun Masuk'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Tahun Masuk tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Lakukan penyimpanan data atau tindakan lainnya
                      // setelah tombol simpan ditekan.
                      // Misalnya, Anda bisa menggunakan nilai yang telah diisi:
                      // _namaController.text, _nipController.text, dll.
                    }
                  },
                  child: Text('Simpan'),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            backgroundColor: kPrimaryColor,
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            backgroundColor: kPrimaryColor,
            icon: Icon(Icons.person_add),
            label: 'Tambah Karyawan',
          ),
          BottomNavigationBarItem(
            backgroundColor: kPrimaryColor,
            icon: Icon(Icons.search),
            label: 'Cari Karyawan',
          ),
          BottomNavigationBarItem(
            backgroundColor: kPrimaryColor,
            icon: Icon(Icons.people),
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
}

void main() {
  runApp(MaterialApp(
    home: TambahDataKaryawanPage(),
  ));
}
