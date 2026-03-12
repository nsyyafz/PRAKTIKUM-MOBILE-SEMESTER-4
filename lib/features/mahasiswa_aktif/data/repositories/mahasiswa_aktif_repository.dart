import 'package:betatest/features/mahasiswa_aktif/data/models/mahasiswa_aktif_model.dart';

class MahasiswaAktifRepository {
  Future<List<MahasiswaAktifModel>> getMahasiswaAktifList() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      MahasiswaAktifModel(
        nama: 'Budi Santoso',
        nim: '2024001',
        jurusan: 'D4 Teknik Informatika',
        semester: '3',
        statusBeasiswa: 'KIP',
        ipk: 3.75,
      ),
      MahasiswaAktifModel(
        nama: 'Sari Dewi',
        nim: '2024002',
        jurusan: 'D4 Teknik Informatika',
        semester: '3',
        statusBeasiswa: 'Tidak Ada',
        ipk: 3.50,
      ),
      MahasiswaAktifModel(
        nama: 'Ahmad Rizki',
        nim: '2024003',
        jurusan: 'D4 Teknik Informatika',
        semester: '5',
        statusBeasiswa: 'Bidikmisi',
        ipk: 3.90,
      ),
    ];
  }
}