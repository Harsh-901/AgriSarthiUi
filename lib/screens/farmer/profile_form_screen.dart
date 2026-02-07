import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../theme/app_colors.dart';
import '../../routes/app_routes.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/custom_dropdown.dart';
import '../../widgets/primary_button.dart';
import '../../utils/validators.dart';

class ProfileFormScreen extends StatefulWidget {
  const ProfileFormScreen({super.key});

  @override
  State<ProfileFormScreen> createState() => _ProfileFormScreenState();
}

class _ProfileFormScreenState extends State<ProfileFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _villageController = TextEditingController();
  final _landSizeController = TextEditingController();

  String _phoneNumber = '9876543210'; // Auto-filled from previous screen
  String? _selectedState;
  String? _selectedDistrict;
  String? _selectedCropType;
  String? _selectedLanguage;
  bool _isLoading = false;

  // Placeholder data - will be replaced with API calls
  final List<String> _states = [
    'Maharashtra',
    'Karnataka',
    'Tamil Nadu',
    'Gujarat',
    'Punjab',
    'Rajasthan',
  ];

  final List<String> _districts = [
    'Pune',
    'Mumbai',
    'Nagpur',
    'Nashik',
    'Aurangabad',
    'Kolhapur',
  ];

  final List<String> _cropTypes = [
    'Rice',
    'Wheat',
    'Cotton',
    'Sugarcane',
    'Soybean',
    'Groundnut',
    'Vegetables',
    'Fruits',
  ];

  final List<String> _languages = [
    'Marathi',
    'Hindi',
    'English',
    'Tamil',
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _villageController.dispose();
    _landSizeController.dispose();
    super.dispose();
  }

  Future<void> _submitDetails() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    // TODO: Call ProfileService.submitDetails()
    await Future.delayed(const Duration(seconds: 1));

    setState(() => _isLoading = false);

    if (mounted) {
      Navigator.pushNamed(context, AppRoutes.documentUpload);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Tell us about yourself',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                // Phone Number (disabled)
                CustomTextField(
                  label: 'Phone Number',
                  controller: TextEditingController(text: _phoneNumber),
                  enabled: false,
                ),
                const SizedBox(height: 20),
                // Full Name
                CustomTextField(
                  label: 'Full Name',
                  hint: 'Enter your full name',
                  controller: _nameController,
                  validator: Validators.validateName,
                ),
                const SizedBox(height: 20),
                // State Dropdown
                CustomDropdown(
                  label: 'State',
                  hint: 'Select your state',
                  value: _selectedState,
                  items: _states,
                  prefixIcon: const Icon(Icons.location_on_outlined, size: 20),
                  onChanged: (value) {
                    setState(() => _selectedState = value);
                  },
                  validator: (value) => Validators.validateDropdown(value, fieldName: 'state'),
                ),
                const SizedBox(height: 20),
                // District Dropdown
                CustomDropdown(
                  label: 'District',
                  hint: 'Select your district',
                  value: _selectedDistrict,
                  items: _districts,
                  prefixIcon: const Icon(Icons.location_on_outlined, size: 20),
                  onChanged: (value) {
                    setState(() => _selectedDistrict = value);
                  },
                  validator: (value) => Validators.validateDropdown(value, fieldName: 'district'),
                ),
                const SizedBox(height: 20),
                // Village
                CustomTextField(
                  label: 'Village',
                  hint: 'Enter your village name',
                  controller: _villageController,
                  validator: (value) => Validators.validateRequired(value, fieldName: 'Village'),
                ),
                const SizedBox(height: 20),
                // Land Size
                CustomTextField(
                  label: 'Land Size (in acres)',
                  hint: 'e.g., 5.5',
                  controller: _landSizeController,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                  ],
                  validator: Validators.validateLandSize,
                ),
                const SizedBox(height: 20),
                // Primary Crop Type
                CustomDropdown(
                  label: 'Primary Crop Type',
                  hint: 'Select primary crop',
                  value: _selectedCropType,
                  items: _cropTypes,
                  prefixIcon: const Icon(Icons.grass_outlined, size: 20),
                  onChanged: (value) {
                    setState(() => _selectedCropType = value);
                  },
                  validator: (value) => Validators.validateDropdown(value, fieldName: 'crop type'),
                ),
                const SizedBox(height: 20),
                // Preferred Language
                CustomDropdown(
                  label: 'Preferred Language',
                  hint: 'Select preferred language',
                  value: _selectedLanguage,
                  items: _languages,
                  prefixIcon: const Icon(Icons.language, size: 20),
                  onChanged: (value) {
                    setState(() => _selectedLanguage = value);
                  },
                  validator: (value) => Validators.validateDropdown(value, fieldName: 'language'),
                ),
                const SizedBox(height: 32),
                // Continue Button
                PrimaryButton(
                  text: 'Continue',
                  onPressed: _submitDetails,
                  isLoading: _isLoading,
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
