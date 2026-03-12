import 'dart:io';

void main() {
  // Data awal
  Map<String, String> data = {
    'Anang': '081234567890',
    'Arman': '082345678901',
    'Doni': '083456789012',
  };
  print('data awal: $data');

  // c. Tambah data
  data['Rio'] = '084567890123';
  print('data setelah ditambahkan: $data');

  // d. Tampilkan berdasarkan key
  print('Nomor Anang: ${data['Anang']}');

  // e. Ubah data
  data['Anang'] = '089999999999';
  print('Setelah diubah: $data');

  // Hapus data
  data.remove('Doni');
  print('Setelah dihapus: $data');

  // Cek key
  print('Apakah Arman ada? ${data.containsKey('Arman')}');

  // Hitung jumlah
  print('Jumlah data: ${data.length}');

  // Tampilkan semua key
  print('Semua key: ${data.keys.toList()}');

  // Tampilkan semua value
  print('Semua value: ${data.values.toList()}');

  // ---- Input Single Mahasiswa ----
  print('\n=== INPUT DATA MAHASISWA ===');
  Map<String, dynamic> mahasiswa = {};

  stdout.write('Masukkan NIM: ');
  mahasiswa['nim'] = stdin.readLineSync()!;

  stdout.write('Masukkan Nama: ');
  mahasiswa['nama'] = stdin.readLineSync()!;

  stdout.write('Masukkan Jurusan: ');
  mahasiswa['jurusan'] = stdin.readLineSync()!;

  stdout.write('Masukkan IPK: ');
  mahasiswa['ipk'] = stdin.readLineSync()!;

  print('Data Mahasiswa: $mahasiswa');

  // ---- Input Multiple Mahasiswa ----
  print('\n=== INPUT MULTIPLE MAHASISWA ===');
  stdout.write('Masukkan jumlah mahasiswa: ');
  int jumlah = int.parse(stdin.readLineSync()!);

  List<Map<String, dynamic>> listMahasiswa = [];

  for (int i = 0; i < jumlah; i++) {
    print('\n---- Mahasiswa ke-${i + 1} ----');
    Map<String, dynamic> mhs = {};

    stdout.write('Masukkan NIM: ');
    mhs['nim'] = stdin.readLineSync()!;

    stdout.write('Masukkan Nama: ');
    mhs['nama'] = stdin.readLineSync()!;

    stdout.write('Masukkan Jurusan: ');
    mhs['jurusan'] = stdin.readLineSync()!;

    stdout.write('Masukkan IPK: ');
    mhs['ipk'] = stdin.readLineSync()!;

    listMahasiswa.add(mhs);
  }

  print('\n=== DATA SEMUA MAHASISWA ===');
  for (var m in listMahasiswa) {
    print(m);
  }
}