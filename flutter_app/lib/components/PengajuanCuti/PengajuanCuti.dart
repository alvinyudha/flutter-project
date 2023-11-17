import 'package:flutter/material.dart';

class PengajuanCutiPage extends StatefulWidget {
  final Map<String, String> karyawanData;

  const PengajuanCutiPage({Key? key, required this.karyawanData})
      : super(key: key);

  @override
  _PengajuanCutiPageState createState() => _PengajuanCutiPageState();
}

class _PengajuanCutiPageState extends State<PengajuanCutiPage> {
  DateTime _selectedStartDate = DateTime.now();
  DateTime _selectedEndDate = DateTime.now();
  TextEditingController _alasanController = TextEditingController();
  int _cutiPerYearLimit = 12; // Batasan cuti per tahun
  int _cutiUsedThisYear = 0; // Jumlah cuti yang sudah digunakan pada tahun ini

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pengajuan Cuti'),
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
              SizedBox(height: 20),
              buildDateRangePicker(),
              SizedBox(height: 20),
              buildDurasiCuti(),
              SizedBox(height: 20),
              buildAlasanInput(),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Proses pengajuan cuti
                  if (validateCutiLimit() && validateAlasan()) {
                    // Jika jumlah cuti yang diajukan belum melebihi batasan per tahun
                    // dan alasan sudah diisi
                    submitPengajuanCuti();
                  } else {
                    // Tampilkan pesan kesalahan jika validasi tidak terpenuhi
                    if (!validateCutiLimit()) {
                      showCutiLimitExceededDialog();
                    } else {
                      showAlasanRequiredDialog();
                    }
                  }
                },
                child: Text('Ajukan'),
              ),
            ],
          ),
        ),
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

  Widget buildDateRangePicker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tanggal Mulai Cuti',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        InkWell(
          onTap: () {
            // Tampilkan date picker saat tanggal mulai cuti di-tap
            showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime.now().add(Duration(days: 365)),
            ).then((selectedDate) {
              if (selectedDate != null) {
                setState(() {
                  _selectedStartDate = selectedDate;
                  // Pastikan tanggal akhir cuti tidak kurang dari tanggal mulai cuti
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
              '${_selectedStartDate.toLocal()}'.split(' ')[0],
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
        SizedBox(height: 16),
        Text(
          'Tanggal Akhir Cuti',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        InkWell(
          onTap: () {
            // Tampilkan date picker saat tanggal akhir cuti di-tap
            showDatePicker(
              context: context,
              initialDate: _selectedStartDate,
              firstDate: _selectedStartDate,
              lastDate: _selectedStartDate.add(Duration(days: 2)),
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
              '${_selectedEndDate.toLocal()}'.split(' ')[0],
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildDurasiCuti() {
    int durasiCuti = _selectedEndDate.difference(_selectedStartDate).inDays + 1;

    return Text(
      'Durasi Cuti: $durasiCuti Hari',
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget buildAlasanInput() {
    return TextFormField(
      controller: _alasanController,
      decoration: InputDecoration(
        hintText: 'Alasan Cuti',
        labelText: 'Alasan Cuti',
      ),
    );
  }

  void submitPengajuanCuti() {
    // Proses pengajuan cuti
    // Kurangi jumlah cuti yang masih dapat diajukan sesuai durasi cuti yang diajukan
    setState(() {
      _cutiUsedThisYear +=
          (_selectedEndDate.difference(_selectedStartDate).inDays + 1);
    });
    showSuccessDialog();
  }

  bool validateCutiLimit() {
    // Validasi apakah jumlah cuti yang diajukan belum melebihi batasan per tahun
    return (_cutiUsedThisYear +
            (_selectedEndDate.difference(_selectedStartDate).inDays + 1)) <=
        _cutiPerYearLimit;
  }

  bool validateAlasan() {
    // Validasi apakah alasan cuti sudah diisi
    return _alasanController.text.isNotEmpty;
  }

  void showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Pengajuan Berhasil'),
          content: Text('Pengajuan cuti Anda telah berhasil diajukan.'),
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

  void showCutiLimitExceededDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Batas Cuti Tahunan Tercapai'),
          content: Text('Maaf, Anda telah mencapai batas cuti tahunan.'),
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

  void showAlasanRequiredDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alasan Diperlukan'),
          content: Text('Silakan isi alasan cuti sebelum mengajukan.'),
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
}
