import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../theme/app_colors.dart';
import '../routes/app_routes.dart';

class LanguageSelectionScreen extends StatefulWidget {
  const LanguageSelectionScreen({super.key});

  @override
  State<LanguageSelectionScreen> createState() => _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  String? _selectedLanguage;

  final List<Map<String, String>> _languages = [
    {'code': 'mr', 'name': 'Marathi'},
    {'code': 'hi', 'name': 'Hindi'},
    {'code': 'en', 'name': 'English'},
    {'code': 'ta', 'name': 'Tamil'},
  ];

  Future<void> _selectLanguage(String code) async {
    setState(() => _selectedLanguage = code);

    // Save language preference
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('preferred_language', code);

    // Navigate to login screen
    if (mounted) {
      Navigator.pushNamed(context, AppRoutes.login);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            children: [
              const Spacer(flex: 2),
              // Title
              const Text(
                'Select Your Language',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 48),
              // Language Buttons
              ...(_languages.map((lang) => Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: () => _selectLanguage(lang['code']!),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _selectedLanguage == lang['code']
                              ? AppColors.primaryDark
                              : AppColors.primary,
                          foregroundColor: AppColors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          lang['name']!,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ))),
              const Spacer(flex: 3),
            ],
          ),
        ),
      ),
    );
  }
}
