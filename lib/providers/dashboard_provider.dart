import 'package:flutter/material.dart';

class DashboardProvider extends ChangeNotifier {
  // Data private (diawali _)
  int _mahasiswa = 120;
  int _dosen = 30;
  int _matakuliah = 45;

  // Getter untuk akses dari luar
  int get mahasiswa => _mahasiswa;
  int get dosen => _dosen;
  int get matakuliah => _matakuliah;

  // Method untuk ubah state
  // notifyListeners() → memberitahu widget untuk rebuild
  void tambahMahasiswa() {
    _mahasiswa++;
    notifyListeners();
  }

  void tambahDosen() {
    _dosen++;
    notifyListeners();
  }

  void tambahMatakuliah() {
    _matakuliah++;
    notifyListeners();
  }
}