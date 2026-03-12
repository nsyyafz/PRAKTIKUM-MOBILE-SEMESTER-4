import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_theme.dart';
import '../../data/models/dashboard_model.dart';

// ═══════════════════════════════════════
// STAT CARD WIDGET (lama, tetap dipertahankan)
// ═══════════════════════════════════════
class StatCard extends StatelessWidget {
  final DashboardStats stats;
  final bool isSelected;
  final VoidCallback? onTap;

  const StatCard({
    Key? key,
    required this.stats,
    this.isSelected = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: isSelected ? 8 : 2,
      color: isSelected ? AppTheme.primaryColor.withOpacity(0.1) : null,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
        child: Padding(
          padding: const EdgeInsets.all(AppConstants.paddingMedium),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(stats.title,
                  style: const TextStyle(
                      fontSize: 14,
                      color: AppTheme.textSecondaryColor,
                      fontWeight: FontWeight.w500)),
              const SizedBox(height: 8),
              Text(stats.value,
                  style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.textPrimaryColor)),
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(
                      stats.isIncrease
                          ? Icons.trending_up
                          : Icons.trending_down,
                      size: 16,
                      color: stats.isIncrease
                          ? AppTheme.successColor
                          : AppTheme.errorColor),
                  const SizedBox(width: 4),
                  Text('${stats.percentage.toStringAsFixed(1)}%',
                      style: TextStyle(
                          fontSize: 12,
                          color: stats.isIncrease
                              ? AppTheme.successColor
                              : AppTheme.errorColor,
                          fontWeight: FontWeight.w600)),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(stats.subtitle,
                        style: const TextStyle(
                            fontSize: 12,
                            color: AppTheme.textSecondaryColor,
                            overflow: TextOverflow.ellipsis)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════
// MODERN STAT CARD WIDGET (baru, untuk Modul 4)
// ═══════════════════════════════════════
class ModernStatCard extends StatelessWidget {
  final DashboardStats stats;
  final IconData icon;
  final List<Color> gradientColors;
  final bool isSelected;
  final VoidCallback? onTap;

  const ModernStatCard({
    Key? key,
    required this.stats,
    required this.icon,
    required this.gradientColors,
    this.isSelected = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: isSelected ? gradientColors : [Colors.white, Colors.white],
          ),
          borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
          boxShadow: [
            BoxShadow(
              color: gradientColors[0].withOpacity(isSelected ? 0.4 : 0.1),
              blurRadius: isSelected ? 12 : 6,
              offset: const Offset(0, 4),
            ),
          ],
          border: Border.all(
            color: gradientColors[0].withOpacity(0.2),
            width: 1.5,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppConstants.paddingMedium),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Icon
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: isSelected
                      ? Colors.white.withOpacity(0.3)
                      : gradientColors[0].withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon,
                    size: 22,
                    color: isSelected ? Colors.white : gradientColors[0]),
              ),
              const SizedBox(height: 8),
              // Value
              Text(
                stats.value,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: isSelected
                      ? Colors.white
                      : AppTheme.textPrimaryColor,
                ),
              ),
              // Title
              Text(
                stats.title,
                style: TextStyle(
                  fontSize: 12,
                  color: isSelected
                      ? Colors.white.withOpacity(0.9)
                      : AppTheme.textSecondaryColor,
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              // Percentage
              Row(
                children: [
                  Icon(
                    stats.isIncrease
                        ? Icons.trending_up_rounded
                        : Icons.trending_down_rounded,
                    size: 14,
                    color: isSelected
                        ? Colors.white
                        : (stats.isIncrease
                            ? AppTheme.successColor
                            : AppTheme.errorColor),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '${stats.percentage.toStringAsFixed(1)}%',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: isSelected
                          ? Colors.white
                          : (stats.isIncrease
                              ? AppTheme.successColor
                              : AppTheme.errorColor),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════
// DASHBOARD HEADER WIDGET
// ═══════════════════════════════════════
class DashboardHeader extends ConsumerWidget {
  final String userName;

  const DashboardHeader({Key? key, required this.userName}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(AppConstants.paddingLarge),
      decoration: const BoxDecoration(
        color: AppTheme.primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(AppConstants.radiusLarge),
          bottomRight: Radius.circular(AppConstants.radiusLarge),
        ),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Selamat Datang,',
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.9),
                            fontSize: 14)),
                    const SizedBox(height: 4),
                    Text(userName,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
                CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.white.withOpacity(0.2),
                  child: const Icon(Icons.person,
                      color: Colors.white, size: 28),
                ),
              ],
            ),
            const SizedBox(height: AppConstants.paddingMedium),
            Text('Data Mahasiswa D4TI',
                style: TextStyle(
                    color: Colors.white.withOpacity(0.8), fontSize: 14)),
          ],
        ),
      ),
    );
  }
}