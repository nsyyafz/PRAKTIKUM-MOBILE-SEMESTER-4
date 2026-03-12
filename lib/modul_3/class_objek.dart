import 'dart:io';

// ═══════════════════════════════════════
// A. CLASS SEDERHANA
// ═══════════════════════════════════════
// class Mahasiswa {
//   String nama = "Anang"; // property dengan nilai default

//   void tampilkanData() {
//     print(nama);
//   }
// }

// void main() {
//   // Membuat object dari class Mahasiswa
//   var mahasiswa1 = Mahasiswa();
//   mahasiswa1.tampilkanData(); // output: Anang

//   // Ubah nama via input
//   stdout.write("Masukkan nama baru: ");
//   String? namaBaru = stdin.readLineSync();
//   if (namaBaru != null && namaBaru.isNotEmpty) {
//     mahasiswa1.nama = namaBaru;
//     print("Nama berhasil diubah.");
//     mahasiswa1.tampilkanData();
//   } else {
//     print("Nama tidak boleh kosong.");
//   }

  // ═══════════════════════════════════════
  // B. OBJECT DENGAN NULL SAFETY
  // ═══════════════════════════════════════
  // class Mahasiswa {
  //   String? nama;    // ? artinya boleh null
  //   int? nim;
  //   String? jurusan;

  //   void tampilkanData() {
  //     print("Nama: ${nama ?? 'Belum diisi'}");
  //     print("NIM: ${nim ?? 'Belum diisi'}");
  //     print("Jurusan: ${jurusan ?? 'Belum diisi'}");
  //   }
  // }

  // void main() {
  //   Mahasiswa mahasiswa = Mahasiswa();

  //   print("Masukkan Nama Mahasiswa:");
  //   mahasiswa.nama = stdin.readLineSync();

  //   print("Masukkan NIM Mahasiswa:");
  //   mahasiswa.nim = int.tryParse(stdin.readLineSync() ?? '');

  //   print("Masukkan Jurusan Mahasiswa:");
  //   mahasiswa.jurusan = stdin.readLineSync();

  //   mahasiswa.tampilkanData();
  // }

// ═══════════════════════════════════════
// CLASS INDUK (BASE CLASS)
// ═══════════════════════════════════════
//   class Mahasiswa {
//     String? nama;
//     int? nim;
//     String? jurusan;

//     Mahasiswa({this.nama, this.nim, this.jurusan});

//     void tampilkanData() {
//       print("Nama   : ${nama ?? '-'}");
//       print("NIM    : ${nim ?? '-'}");
//       print("Jurusan: ${jurusan ?? '-'}");
//     }
//   }

//   // ═══════════════════════════════════════
//   // CLASS ANAK 1 — MahasiswaAktif
//   // extends berarti mewarisi semua dari Mahasiswa
//   // ═══════════════════════════════════════
//   class MahasiswaAktif extends Mahasiswa {
//     String? semester;
//     String? statusBeasiswa;

//     MahasiswaAktif({
//       String? nama,
//       int? nim,
//       String? jurusan,
//       this.semester,
//       this.statusBeasiswa,
//     }) : super(nama: nama, nim: nim, jurusan: jurusan);
//     // super() memanggil constructor class induk

//     @override // menimpa method dari class induk
//     void tampilkanData() {
//       super.tampilkanData(); // panggil method induk dulu
//       print("Semester  : ${semester ?? '-'}");
//       print("Beasiswa  : ${statusBeasiswa ?? 'Tidak ada'}");
//     }

//     void daftarKRS() {
//       print("$nama sedang melakukan KRS semester $semester");
//     }
//   }

//   // ═══════════════════════════════════════
//   // CLASS ANAK 2 — MahasiswaAlumni
//   // ═══════════════════════════════════════
//   class MahasiswaAlumni extends Mahasiswa {
//     int? tahunLulus;
//     String? tempatKerja;

//     MahasiswaAlumni({
//       String? nama,
//       int? nim,
//       String? jurusan,
//       this.tahunLulus,
//       this.tempatKerja,
//     }) : super(nama: nama, nim: nim, jurusan: jurusan);

//     @override
//     void tampilkanData() {
//       super.tampilkanData();
//       print("Tahun Lulus : ${tahunLulus ?? '-'}");
//       print("Tempat Kerja: ${tempatKerja ?? '-'}");
//     }

//     void cetakIjazah() {
//       print("Mencetak ijazah untuk $nama lulusan $tahunLulus");
//     }
//   }

//   void main() {
//     print("=== DATA MAHASISWA AKTIF ===");
//     MahasiswaAktif aktif = MahasiswaAktif(
//       nama: "Budi",
//       nim: 20230001,
//       jurusan: "D4 TI",
//       semester: "5",
//       statusBeasiswa: "KIP",
//     );
//     aktif.tampilkanData();
//     aktif.daftarKRS();

//     print("\n=== DATA MAHASISWA ALUMNI ===");
//     MahasiswaAlumni alumni = MahasiswaAlumni(
//       nama: "Sari",
//       nim: 20190010,
//       jurusan: "D4 TI",
//       tahunLulus: 2023,
//       tempatKerja: "Gojek",
//     );
//     alumni.tampilkanData();
//     alumni.cetakIjazah();
// }

// ═══════════════════════════════════════
// BASE CLASS
// ═══════════════════════════════════════
class Mahasiswa {
  String nama;
  int nim;
  Mahasiswa({required this.nama, required this.nim});
}

// ═══════════════════════════════════════
// MIXIN 1 — Kemampuan Mengajar
// ═══════════════════════════════════════
mixin BisaMengajar {
  List<String> mataKuliah = [];

  void tambahMataKuliah(String mk) {
    mataKuliah.add(mk);
    print("Mata kuliah '$mk' ditambahkan.");
  }

  void tampilkanMataKuliah() {
    print("Mata Kuliah yang diajar: $mataKuliah");
  }
}

// ═══════════════════════════════════════
// MIXIN 2 — Kemampuan Meneliti
// ═══════════════════════════════════════
mixin BisaMeneliti {
  String? topikPenelitian;

  void setTopikPenelitian(String topik) {
    topikPenelitian = topik;
    print("Topik penelitian: $topikPenelitian");
  }

  void publikasiJurnal() {
    print("Mempublikasikan jurnal tentang: $topikPenelitian");
  }
}

// ═══════════════════════════════════════
// MIXIN 3 — Kemampuan Administrasi
// ═══════════════════════════════════════
mixin BisaAdministrasi {
  void buatLaporan(String jenis) {
    print("Membuat laporan: $jenis");
  }

  void tandatanganiDokumen(String dokumen) {
    print("Menandatangani: $dokumen");
  }
}

// ═══════════════════════════════════════
// CLASS Dosen — extends + with mixin
// ═══════════════════════════════════════
class Dosen extends Mahasiswa
    with BisaMengajar, BisaMeneliti, BisaAdministrasi {
  String nip;

  Dosen({
    required String nama,
    required int nim,
    required this.nip,
  }) : super(nama: nama, nim: nim);

  void tampilkanProfil() {
    print("Nama  : $nama");
    print("NIP   : $nip");
  }
}

// ═══════════════════════════════════════
// CLASS Fakultas — with mixin
// ═══════════════════════════════════════
class Fakultas extends Mahasiswa
    with BisaAdministrasi, BisaMeneliti {
  String namaFakultas;

  Fakultas({
    required String nama,
    required int nim,
    required this.namaFakultas,
  }) : super(nama: nama, nim: nim);

  void tampilkanFakultas() {
    print("Fakultas: $namaFakultas");
    print("Dekan   : $nama");
  }
}

void main() {
  print("=== DOSEN ===");
  Dosen dosen = Dosen(nama: "Dr. Andi", nim: 198501, nip: "NIP123456");
  dosen.tampilkanProfil();
  dosen.tambahMataKuliah("Pemrograman Mobile");
  dosen.tambahMataKuliah("Basis Data");
  dosen.tampilkanMataKuliah();
  dosen.setTopikPenelitian("Flutter & AI");
  dosen.publikasiJurnal();
  dosen.buatLaporan("Laporan Akademik 2024");

  print("\n=== FAKULTAS ===");
  Fakultas fak = Fakultas(
    nama: "Prof. Budi",
    nim: 197001,
    namaFakultas: "Fakultas Teknik",
  );
  fak.tampilkanFakultas();
  fak.setTopikPenelitian("Teknologi Informasi");
  fak.tandatanganiDokumen("SK Dekan");
}