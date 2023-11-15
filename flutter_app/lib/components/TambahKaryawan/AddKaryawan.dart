import 'package:flutter/material.dart';
import 'package:login_project/constant.dart';
import 'package:get/get.dart';
import 'package:login_project/components/CariKaryawan/SearchKaryawan.dart';

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
                buildFormField(
                  controller: _namaController,
                  labelText: 'Nama',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nama tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                buildFormField(
                  controller: _nipController,
                  labelText: 'NIP',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'NIP tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                buildDropdownFormField(
                  value: _selectedJenisKelamin,
                  items: ['Laki-laki', 'Perempuan'],
                  onChanged: (value) {
                    setState(() {
                      _selectedJenisKelamin = value;
                    });
                  },
                  labelText: 'Jenis Kelamin',
                ),
                buildFormField(
                  controller: _alamatController,
                  labelText: 'Alamat',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Alamat tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                buildFormField(
                  controller: _divisiController,
                  labelText: 'Divisi',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Divisi tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                buildFormField(
                  controller: _jabatanController,
                  labelText: 'Jabatan',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Jabatan tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                buildFormField(
                  controller: _tahunMasukController,
                  labelText: 'Tahun Masuk',
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
              Get.to(CariKaryawanPage()); // Gantilah dengan rute yang sesuai
              break;
            case 3:
              // Navigasi ke halaman Data Karyawan
              break;
          }
        },
      ),
    );
  }

  Widget buildFormField({
    required TextEditingController controller,
    required String labelText,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(),
        ),
        keyboardType: keyboardType,
        validator: validator,
      ),
    );
  }

  Widget buildDropdownFormField({
    required String? value,
    required List<String> items,
    required void Function(String?)? onChanged,
    required String labelText,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: DropdownButtonFormField<String>(
        value: value,
        items: items
            .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                ))
            .toList(),
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(),
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

void main() {
  runApp(MaterialApp(
    home: TambahDataKaryawanPage(),
  ));
}
