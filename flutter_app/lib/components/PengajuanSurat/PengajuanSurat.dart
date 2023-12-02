import 'package:flutter/material.dart';
import 'package:login_project/utilities/constant.dart';
import 'package:login_project/components/RiwayatCuti/RiwayatCuti.dart';

class PengajuanSuratPage extends StatefulWidget {
  final Map<String, String> karyawanData;

  const PengajuanSuratPage({Key? key, required this.karyawanData})
      : super(key: key);

  @override
  _PengajuanSuratPageState createState() => _PengajuanSuratPageState();
}

class _PengajuanSuratPageState extends State<PengajuanSuratPage> {
  String? _selectedSurat;
  DateTime _selectedStartDate = DateTime.now();
  DateTime _selectedEndDate = DateTime.now();
  TextEditingController _alasanController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pengajuan Surat'),
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
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: const Color(0xFFEEF5FF),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildDataField('Nama', widget.karyawanData['Nama']),
                buildDataField('NIP', widget.karyawanData['NIP']),
                SizedBox(height: 20),
                buildSuratDropdown(),
                SizedBox(height: 20),
                buildDateRangePicker(),
                SizedBox(height: 20),
                buildDurasiIzin(),
                SizedBox(height: 20),
                buildAlasanInput(),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_validateForm()) {
                      submitPengajuanSurat();
                    } else {
                      showValidationErrorDialog;
                    }
                  },
                  child: Text('Ajukan'),
                ),
                const SizedBox(height: 20),
                _buildRiwayatButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSuratDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Jenis Surat Izin',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        DropdownButton<String>(
          value: _selectedSurat,
          onChanged: (String? newValue) {
            setState(() {
              _selectedSurat = newValue;
            });
          },
          items: <String>[
            'Izin Menikah',
            'Izin Melahirkan',
            'Izin Tidak Masuk',
            'Izin Tugas',
            'Izin Resign',
          ].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ],
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

  Widget buildDateRangePicker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tanggal Mulai Izin',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        InkWell(
          onTap: () {
            showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime.now().add(Duration(days: 365)),
            ).then((selectedDate) {
              if (selectedDate != null) {
                setState(() {
                  _selectedStartDate = selectedDate;
                  // Pastikan tanggal akhir izin tidak kurang dari tanggal mulai izin
                  if (_selectedEndDate.isBefore(_selectedStartDate)) {
                    _selectedEndDate = _selectedStartDate;
                  }
                });
              }
            });
          },
          child: Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              '${_selectedStartDate.toLocal().toString().split(' ')[0]}',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
        SizedBox(height: 16),
        Text(
          'Tanggal Akhir Izin',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        InkWell(
          onTap: () {
            showDatePicker(
              context: context,
              initialDate: _selectedStartDate,
              firstDate: _selectedStartDate,
              lastDate: DateTime.now().add(Duration(days: 365)),
            ).then((selectedDate) {
              if (selectedDate != null) {
                setState(() {
                  _selectedEndDate = selectedDate;
                });
              }
            });
          },
          child: Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              '${_selectedEndDate.toLocal().toString().split(' ')[0]}',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildDurasiIzin() {
    int durasiIzin = _selectedEndDate.difference(_selectedStartDate).inDays + 1;

    return Text(
      'Durasi Izin: $durasiIzin Hari',
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget buildAlasanInput() {
    return TextFormField(
      controller: _alasanController,
      decoration: InputDecoration(
        hintText: 'Alasan Izin',
        labelText: 'Alasan Izin',
      ),
    );
  }

  void submitPengajuanSurat() {
    showSuccessDialog();
  }

  void showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Pengajuan Berhasil'),
          content: const Text('Pengajuan surat Anda telah berhasil diajukan.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Navigasi ke halaman riwayat pengajuan cuti dan sertakan data pengajuan surat
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RiwayatPengajuanCutiPage(
                      riwayatPengajuanCuti: [
                        // Ganti dengan data pengajuan yang sesuai
                        {
                          'tanggalPengajuan': DateTime.now(),
                          'tanggalMulai': _selectedStartDate,
                          'tanggalAkhir': _selectedEndDate,
                          'durasiCuti': _selectedEndDate
                                  .difference(_selectedStartDate)
                                  .inDays +
                              1,
                          'status': 'Diajukan',
                          'alasanCuti': _alasanController.text,
                        },
                        // ... tambahkan data pengajuan lainnya jika ada
                      ],
                    ),
                  ),
                );
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildRiwayatButton() {
    return ElevatedButton(
      onPressed: () {
        // Navigasi ke halaman riwayat pengajuan cuti
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RiwayatPengajuanCutiPage(
              // Sertakan data riwayat pengajuan
              riwayatPengajuanCuti: [], // Ganti dengan data yang sesuai
            ),
          ),
        );
      },
      child: const Text('Riwayat Pengajuan'),
    );
  }

  void showValidationErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Pengajuan Gagal'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  bool _validateForm() {
    if (_selectedSurat != null && _alasanController.text.isEmpty) {
      showValidationErrorDialog('Silakan isi alasan izin sebelum mengajukan.');
      return false;
    } else if (_selectedSurat == null && _alasanController.text.isNotEmpty) {
      showValidationErrorDialog(
          'Silakan pilih jenis surat sebelum mengajukan.');
      return false;
    } else if (_selectedSurat == null && _alasanController.text.isEmpty) {
      showValidationErrorDialog(
          'Silakan pilih jenis surat dan isi alasan izin sebelum mengajukan.');
      return false;
    }
    return true;
  }
}
