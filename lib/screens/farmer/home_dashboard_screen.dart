import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../routes/app_routes.dart';
import '../../widgets/scheme_card.dart';
import '../../widgets/bottom_nav_bar.dart';

class HomeDashboardScreen extends StatefulWidget {
  const HomeDashboardScreen({super.key});

  @override
  State<HomeDashboardScreen> createState() => _HomeDashboardScreenState();
}

class _HomeDashboardScreenState extends State<HomeDashboardScreen> {
  int _currentIndex = 0;

  // Placeholder scheme data
  final List<Map<String, dynamic>> _schemes = [
    {
      'id': '1',
      'title': 'PM Kisan Samman Nidhi',
      'description': 'Direct income support of ₹6000 per year to eligible farmer families',
      'status': 'Open',
    },
    {
      'id': '2',
      'title': 'Soil Health Card Scheme',
      'description': 'Free soil testing and crop-wise fertilizer recommendations',
      'status': 'Open',
    },
    {
      'id': '3',
      'title': 'Pradhan Mantri Fasal Bima Yojana',
      'description': 'Crop insurance scheme for farmers against crop loss',
      'status': 'Closing Soon',
    },
  ];

  void _onNavTap(int index) {
    setState(() => _currentIndex = index);

    switch (index) {
      case 0:
        // Already on home
        break;
      case 1:
        // Applications - placeholder
        break;
      case 2:
        Navigator.pushNamed(context, AppRoutes.documentUpload);
        break;
      case 3:
        Navigator.pushNamed(context, AppRoutes.videos);
        break;
      case 4:
        Navigator.pushNamed(context, AppRoutes.profile);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.eco, color: AppColors.white, size: 24),
            ),
            const SizedBox(width: 12),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'AgriSarthi',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Welcome, Farmer!',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.record_voice_over_outlined, 
                color: AppColors.textPrimary),
            onPressed: () {
              // TODO: Implement voice feature
            },
          ),
          IconButton(
            icon: Stack(
              children: [
                const Icon(Icons.notifications_outlined, 
                    color: AppColors.textPrimary),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: AppColors.error,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.notifications);
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Available Schemes',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Apply for government schemes to get benefits',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          // Scheme Cards
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _schemes.length,
              itemBuilder: (context, index) {
                final scheme = _schemes[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: SchemeCard(
                    title: scheme['title'],
                    description: scheme['description'],
                    status: scheme['status'],
                    onApplyPressed: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.applySummary,
                        arguments: {'schemeId': scheme['id']},
                      );
                    },
                    onTap: () {
                      // TODO: Navigate to scheme details
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onNavTap,
      ),
    );
  }
}
