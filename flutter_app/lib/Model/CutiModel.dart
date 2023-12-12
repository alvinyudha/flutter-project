class CutiModel {
  final int id;
  final String nama;
  final DateTime tanggalMulai;
  final DateTime tanggalSelesai;
  final String alasan;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int durasi;
  final int userId;

  CutiModel({
    required this.id,
    required this.nama,
    required this.tanggalMulai,
    required this.tanggalSelesai,
    required this.alasan,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.durasi,
    required this.userId,
  });

  factory CutiModel.fromJson(Map<String, dynamic> json) {
    return CutiModel(
      id: json['id'],
      nama: json['nama'],
      tanggalMulai: DateTime.parse(json['tanggal_mulai']),
      tanggalSelesai: DateTime.parse(json['tanggal_selesai']),
      alasan: json['alasan'],
      status: json['status'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      durasi: json['durasi'],
      userId: json['user_id'] ?? 0,
    );
  }
}
