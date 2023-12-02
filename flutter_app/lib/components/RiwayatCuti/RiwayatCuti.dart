import 'package:flutter/material.dart';
import 'package:login_project/utilities/constant.dart';

class RiwayatPengajuanCutiPage extends StatelessWidget {
  final List<Map<String, dynamic>> riwayatPengajuanCuti;

  const RiwayatPengajuanCutiPage({Key? key, required this.riwayatPengajuanCuti})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riwayat Pengajuan'),
        backgroundColor: Colors.transparent,
        toolbarHeight: 76,
        elevation: 0.0,
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            gradient: LinearGradient(
              colors: [kPrimaryColor, kSecondaryColor],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Kembali ke halaman sebelumnya
            Navigator.pop(context);
          },
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
                for (var data in riwayatPengajuanCuti) ...[
                  buildPengajuanCutiCard(data),
                  const SizedBox(height: 20),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildPengajuanCutiCard(Map<String, dynamic> data) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildDataField('Tanggal Pengajuan',
              '${data['tanggalPengajuan'].toLocal().toString().split('.')[0]}'),
          buildDataField('Tanggal Mulai',
              '${data['tanggalMulai'].toLocal().toString().split(' ')[0]}'),
          buildDataField('Tanggal Akhir',
              '${data['tanggalAkhir'].toLocal().toString().split(' ')[0]}'),
          buildDataField('Durasi Cuti', '${data['durasiCuti']} Hari'),
          buildDataField('Status', data['status']),
          buildDataField('Alasan Cuti', data['alasanCuti']),
          if (data['catatan'] != null)
            buildDataField('Catatan', data['catatan']),
        ],
      ),
    );
  }

  Widget buildDataField(String label, dynamic value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(value.toString()),
        ],
      ),
    );
  }
}
