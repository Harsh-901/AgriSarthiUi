import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/primary_button.dart';

class ManageSchemesScreen extends StatefulWidget {
  const ManageSchemesScreen({super.key});

  @override
  State<ManageSchemesScreen> createState() => _ManageSchemesScreenState();
}

class _ManageSchemesScreenState extends State<ManageSchemesScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _eligibilityController = TextEditingController();
  
  bool _isLoading = false;
  bool _showForm = false;

  // Placeholder schemes
  final List<Map<String, dynamic>> _schemes = [
    {
      'id': '1',
      'name': 'PM Kisan Samman Nidhi',
      'description': 'Direct income support of ₹6000 per year',
      'status': 'active',
    },
    {
      'id': '2',
      'name': 'Soil Health Card Scheme',
      'description': 'Free soil testing and recommendations',
      'status': 'active',
    },
    {
      'id': '3',
      'name': 'Pradhan Mantri Fasal Bima Yojana',
      'description': 'Crop insurance scheme for farmers',
      'status': 'inactive',
    },
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _eligibilityController.dispose();
    super.dispose();
  }

  Future<void> _createScheme() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    // TODO: Call AdminService.createScheme()
    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      _isLoading = false;
      _showForm = false;
      _schemes.add({
        'id': DateTime.now().millisecondsSinceEpoch.toString(),
        'name': _nameController.text,
        'description': _descriptionController.text,
        'status': 'active',
      });
      _nameController.clear();
      _descriptionController.clear();
      _eligibilityController.clear();
    });

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Scheme created successfully')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Manage Schemes',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              _showForm ? Icons.close : Icons.add,
              color: AppColors.primary,
            ),
            onPressed: () => setState(() => _showForm = !_showForm),
          ),
        ],
      ),
      body: Column(
        children: [
          // Add Scheme Form
          if (_showForm)
            Container(
              color: AppColors.white,
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Add New Scheme',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      label: 'Scheme Name',
                      hint: 'Enter scheme name',
                      controller: _nameController,
                      validator: (v) => v?.isEmpty ?? true ? 'Required' : null,
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      label: 'Description',
                      hint: 'Enter scheme description',
                      controller: _descriptionController,
                      maxLines: 3,
                      validator: (v) => v?.isEmpty ?? true ? 'Required' : null,
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      label: 'Eligibility Criteria',
                      hint: 'Enter eligibility criteria (comma separated)',
                      controller: _eligibilityController,
                      maxLines: 2,
                    ),
                    const SizedBox(height: 20),
                    PrimaryButton(
                      text: 'Create Scheme',
                      onPressed: _createScheme,
                      isLoading: _isLoading,
                    ),
                  ],
                ),
              ),
            ),
          // Schemes List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _schemes.length,
              itemBuilder: (context, index) {
                final scheme = _schemes[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.borderLight),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    title: Row(
                      children: [
                        Expanded(
                          child: Text(
                            scheme['name'],
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: scheme['status'] == 'active'
                                ? AppColors.success.withOpacity(0.1)
                                : AppColors.textHint.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            scheme['status'].toString().toUpperCase(),
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: scheme['status'] == 'active'
                                  ? AppColors.success
                                  : AppColors.textHint,
                            ),
                          ),
                        ),
                      ],
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8),
                        Text(
                          scheme['description'],
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            OutlinedButton.icon(
                              onPressed: () {
                                // TODO: Edit scheme
                              },
                              icon: const Icon(Icons.edit_outlined, size: 16),
                              label: const Text('Edit'),
                              style: OutlinedButton.styleFrom(
                                foregroundColor: AppColors.primary,
                                side: const BorderSide(color: AppColors.primary),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 8,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            OutlinedButton.icon(
                              onPressed: () {
                                setState(() {
                                  _schemes.removeAt(index);
                                });
                              },
                              icon: const Icon(Icons.delete_outline, size: 16),
                              label: const Text('Delete'),
                              style: OutlinedButton.styleFrom(
                                foregroundColor: AppColors.error,
                                side: const BorderSide(color: AppColors.error),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 8,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
