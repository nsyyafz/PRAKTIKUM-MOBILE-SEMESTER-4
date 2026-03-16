import 'dart:convert';
import 'package:dio/dio.dart';
import '../models/mahasiswa_model.dart';

class MahasiswaRepository {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://jsonplaceholder.typicode.com',
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
    headers: {'Accept': 'application/json'},
    validateStatus: (status) => status != null && status < 500,
  ));

  Future<List<MahasiswaModel>> getMahasiswaList() async {
    final response = await _dio.get('/comments');
    
    // ← Tambah pengecekan tipe data
    List<dynamic> data;
    if (response.data is String) {
      data = jsonDecode(response.data); // kalau String, decode dulu
    } else {
      data = response.data;             // kalau sudah List, langsung pakai
    }
    
    return data.map((json) => MahasiswaModel.fromJson(json)).toList();
  }
}