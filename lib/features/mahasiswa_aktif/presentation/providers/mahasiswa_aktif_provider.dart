import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:betatest/features/mahasiswa_aktif/data/models/mahasiswa_aktif_model.dart';
import 'package:betatest/features/mahasiswa_aktif/data/repositories/mahasiswa_aktif_repository.dart';

final mahasiswaAktifRepositoryProvider =
    Provider<MahasiswaAktifRepository>((ref) => MahasiswaAktifRepository());

class MahasiswaAktifNotifier
    extends StateNotifier<AsyncValue<List<MahasiswaAktifModel>>> {
  final MahasiswaAktifRepository _repository;

  MahasiswaAktifNotifier(this._repository) : super(const AsyncValue.loading()) {
    load();
  }

  Future<void> load() async {
    state = const AsyncValue.loading();
    try {
      final data = await _repository.getMahasiswaAktifList();
      state = AsyncValue.data(data);
    } catch (e, s) {
      state = AsyncValue.error(e, s);
    }
  }

  Future<void> refresh() async => load();
}

final mahasiswaAktifNotifierProvider = StateNotifierProvider<MahasiswaAktifNotifier, AsyncValue<List<MahasiswaAktifModel>>>((ref) {
  final repository = ref.watch(mahasiswaAktifRepositoryProvider);
  return MahasiswaAktifNotifier(repository);
});