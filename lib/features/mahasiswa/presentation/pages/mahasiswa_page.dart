import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:betatest/core/constants/app_constants.dart';
import 'package:betatest/core/widgets/common_widgets.dart';
import 'package:betatest/features/mahasiswa/presentation/providers/mahasiswa_provider.dart';
import 'package:betatest/features/mahasiswa/presentation/widgets/mahasiswa_widget.dart';

class MahasiswaPage extends ConsumerWidget {
  const MahasiswaPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(mahasiswaNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Mahasiswa'),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            onPressed: () => ref.invalidate(mahasiswaNotifierProvider),
          ),
        ],
      ),
      body: state.when(
        loading: () => const LoadingWidget(),
        error: (error, stack) => CustomErrorWidget(
          message: 'Gagal memuat data: ${error.toString()}',
          onRetry: () => ref.read(mahasiswaNotifierProvider.notifier).refresh(),
        ),
        data: (list) => RefreshIndicator(
          onRefresh: () async => ref.invalidate(mahasiswaNotifierProvider),
          child: ListView.builder(
            padding: const EdgeInsets.all(AppConstants.paddingMedium),
            itemCount: list.length,
            itemBuilder: (context, index) {
              return MahasiswaCard(
                mahasiswa: list[index],
                gradientColors: AppConstants.dashboardGradients[
                    index % AppConstants.dashboardGradients.length],
              );
            },
          ),
        ),
      ),
    );
  }
}