import 'dart:io';

void main() {
  // d. List awal
  List<String> names = ['Alfa', 'beta', 'Charlie'];
  print('Names: $names');

  // e. Tambah data
  names.add('Delta');
  print('Names setelah ditambahkan: $names');

  // f. Tampilkan index tertentu
  print('Elemen pertama: ${names[0]}');
  print('Elemen kedua: ${names[1]}');

   // g. Ubah data pada index tertentu
  names[1] = 'Bravo';
  print('Names setelah diubah: $names');

  // h. Hapus data tertentu
  names.remove('Charlie');
  print('Names setelah dihapus: $names');

  // i. Hitung jumlah data
  print('Jumlah data: ${names.length}');

 // j. Tampilkan semua data dengan looping
  print('Menampilkan setiap elemen:');
  for (String name in names) {
    print(name);
  }

 // l. List dengan input data
  List<String> dataList = [];
  print('Data list kosong: $dataList');

  int count = 0;
  while (count <= 0) {
    stdout.write('Masukkan jumlah list: ');
    String? input = stdin.readLineSync();
    try {
      count = int.parse(input!);
      if (count <= 0) {
        print('Masukkan angka lebih dari 0!');
      }
    } catch (e) {
      print('Input tidak valid! Masukkan angka yang benar.');
    }
  }

  for (int i = 0; i < count; i++) {
    stdout.write('data ke-${i + 1}: ');
    String x = stdin.readLineSync()!;
    dataList.add(x);
  }

  print('Data list:');
  print(dataList);

  // m. Tampil, ubah, hapus berdasarkan index + tampil hasil akhir
  print('\n=== SEMUA DATA ===');
  for (int i = 0; i < dataList.length; i++) {
    print('Index $i: ${dataList[i]}');
  }

  // Tampil berdasarkan index
  stdout.write('\nMasukkan index yang ingin ditampilkan: ');
  int indexTampil = int.parse(stdin.readLineSync()!);
  if (indexTampil >= 0 && indexTampil < dataList.length) {
    print('Data index $indexTampil: ${dataList[indexTampil]}');
  } else {
    print('Index tidak valid!');
  }

  // Ubah berdasarkan index
  stdout.write('Masukkan index yang ingin diubah: ');
  int indexUbah = int.parse(stdin.readLineSync()!);
  stdout.write('Masukkan data baru: ');
  String dataBaru = stdin.readLineSync()!;
  if (indexUbah >= 0 && indexUbah < dataList.length) {
    dataList[indexUbah] = dataBaru;
    print('Data berhasil diubah!');
  }

  // Hapus berdasarkan index
  stdout.write('Masukkan index yang ingin dihapus: ');
  int indexHapus = int.parse(stdin.readLineSync()!);
  if (indexHapus >= 0 && indexHapus < dataList.length) {
    dataList.removeAt(indexHapus);
    print('Data berhasil dihapus!');
  }

  // Tampilkan hasil akhir
  print('\n=== SEMUA DATA ===');
  for (int i = 0; i < dataList.length; i++) {
    print('Index $i: ${dataList[i]}');
  }
}