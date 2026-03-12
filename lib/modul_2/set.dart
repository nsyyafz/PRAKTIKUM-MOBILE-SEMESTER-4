import 'dart:io';

void main() {
  // Data awal
  Set<String> burung = {'Merpati', 'Elang', 'Kakatua'};
  print('Burung: $burung');

  // Tambah data
  burung.add('Nuri');
  print('Setelah ditambah: $burung');

  // Tambah data duplicate (tidak akan masuk)
  burung.add('Elang');
  print('Setelah tambah duplikat Elang: $burung');

  // Hapus data
  burung.remove('Merpati');
  print('Setelah dihapus: $burung');

  // Cek data tertentu
  print('Apakah Elang ada? ${burung.contains('Elang')}');

  // Hitung jumlah data
  print('Jumlah data: ${burung.length}');

  // ---- Dengan Input ----
  Set<String> dataSet = {};

  int count = 0;
  while (count <= 0) {
    stdout.write('Masukkan jumlah data: ');
    try {
      count = int.parse(stdin.readLineSync()!);
      if (count <= 0) print('Masukkan angka lebih dari 0!');
    } catch (e) {
      print('Input tidak valid!');
    }
  }

  for (int i = 0; i < count; i++) {
    stdout.write('data ke-${i + 1}: ');
    dataSet.add(stdin.readLineSync()!);
  }

  print('\n=== SEMUA DATA ===');
  int nomor = 1;
  for (String item in dataSet) {
    print('$nomor. $item');
    nomor++;
  }
  print('Total data: ${dataSet.length}');

  // Tambah data baru
  stdout.write('Masukkan data baru: ');
  String dataBaru = stdin.readLineSync()!;
  if (dataSet.add(dataBaru)) {
    print('Data "$dataBaru" berhasil ditambahkan!');
  } else {
    print('Data "$dataBaru" sudah ada (duplikat)!');
  }

  // Hapus data
  stdout.write('Masukkan data yang ingin dihapus: ');
  String dataHapus = stdin.readLineSync()!;
  if (dataSet.remove(dataHapus)) {
    print('Data "$dataHapus" berhasil dihapus!');
  } else {
    print('Data "$dataHapus" tidak ditemukan!');
  }

  // Cek data
  stdout.write('Masukkan data yang ingin dicek: ');
  String dataCek = stdin.readLineSync()!;
  if (dataSet.contains(dataCek)) {
    print('Data "$dataCek" ada di Set!');
  } else {
    print('Data "$dataCek" tidak ada di Set!');
  }
}