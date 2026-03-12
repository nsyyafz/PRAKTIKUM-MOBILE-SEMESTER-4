import 'package:betatest/features/mahasiswa/data/models/mahasiswa_model.dart';

class MahasiswaRepository {
  Future<List<MahasiswaModel>> getMahasiswaList() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      MahasiswaModel(
        nama: 'Budi Santoso',
        nim: '2024001',
        email: 'budi@student.example.com',
        jurusan: 'D4 Teknik Informatika',
        semester: '3',
      ),
      MahasiswaModel(
        nama: 'Sari Dewi',
        nim: '2024002',
        email: 'sari@student.example.com',
        jurusan: 'D4 Teknik Informatika',
        semester: '3',
      ),
      MahasiswaModel(
        nama: 'Ahmad Rizki',
        nim: '2024003',
        email: 'ahmad@student.example.com',
        jurusan: 'D4 Teknik Informatika',
        semester: '5',
      ),
      MahasiswaModel(
        nama: 'Dewi Rahayu',
        nim: '2024004',
        email: 'dewi@student.example.com',
        jurusan: 'D4 Teknik Informatika',
        semester: '5',
      ),
    ];
  }
}