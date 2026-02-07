import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../routes/app_routes.dart';
import '../../widgets/document_card.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/custom_text_field.dart';

class DocumentUploadScreen extends StatefulWidget {
  const DocumentUploadScreen({super.key});

  @override
  State<DocumentUploadScreen> createState() => _DocumentUploadScreenState();
}

class _DocumentUploadScreenState extends State<DocumentUploadScreen> {
  final _customDocNameController = TextEditingController();
  bool _isLoading = false;

  // Document upload status
  final Map<String, String> _documentStatus = {
    'aadhaar': 'Pending',
    'pan': 'Pending',
    'land_certificate': 'Pending',
    '7_12_extract': 'Pending',
    '8a_document': 'Pending',
    'bank_passbook': 'Pending',
  };

  final List<Map<String, dynamic>> _customDocuments = [];

  bool get _allMandatoryUploaded {
    return !_documentStatus.values.any((status) => status == 'Pending');
  }

  @override
  void dispose() {
    _customDocNameController.dispose();
    super.dispose();
  }

  Future<void> _pickFromCamera(String docType) async {
    // TODO: Implement camera picker using image_picker package
    // TODO: Call DocumentService.uploadDocument()
    setState(() {
      _documentStatus[docType] = 'Uploaded';
    });
  }

  Future<void> _pickFromFile(String docType) async {
    // TODO: Implement file picker using file_picker package
    // TODO: Call DocumentService.uploadDocument()
    setState(() {
      _documentStatus[docType] = 'Uploaded';
    });
  }

  void _addCustomDocument() {
    if (_customDocNameController.text.trim().isEmpty) return;

    setState(() {
      _customDocuments.add({
        'name': _customDocNameController.text.trim(),
        'status': 'Pending',
      });
      _customDocNameController.clear();
    });
  }

  Future<void> _continue() async {
    setState(() => _isLoading = true);

    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));

    setState(() => _isLoading = false);

    if (mounted) {
      Navigator.pushNamed(context, AppRoutes.processing);
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
          'Upload Required Documents',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Mandatory Documents
                    DocumentCard(
                      title: 'Aadhaar Card',
                      status: _documentStatus['aadhaar']!,
                      isUploaded: _documentStatus['aadhaar'] != 'Pending',
                      onCameraPressed: () => _pickFromCamera('aadhaar'),
                      onFilePressed: () => _pickFromFile('aadhaar'),
                    ),
                    const SizedBox(height: 12),
                    DocumentCard(
                      title: 'PAN Card',
                      status: _documentStatus['pan']!,
                      isUploaded: _documentStatus['pan'] != 'Pending',
                      onCameraPressed: () => _pickFromCamera('pan'),
                      onFilePressed: () => _pickFromFile('pan'),
                    ),
                    const SizedBox(height: 12),
                    DocumentCard(
                      title: 'Land Certificate',
                      status: _documentStatus['land_certificate']!,
                      isUploaded: _documentStatus['land_certificate'] != 'Pending',
                      onCameraPressed: () => _pickFromCamera('land_certificate'),
                      onFilePressed: () => _pickFromFile('land_certificate'),
                    ),
                    const SizedBox(height: 12),
                    DocumentCard(
                      title: '7/12 Extract',
                      status: _documentStatus['7_12_extract']!,
                      isUploaded: _documentStatus['7_12_extract'] != 'Pending',
                      onCameraPressed: () => _pickFromCamera('7_12_extract'),
                      onFilePressed: () => _pickFromFile('7_12_extract'),
                    ),
                    const SizedBox(height: 12),
                    DocumentCard(
                      title: '8A Document',
                      status: _documentStatus['8a_document']!,
                      isUploaded: _documentStatus['8a_document'] != 'Pending',
                      onCameraPressed: () => _pickFromCamera('8a_document'),
                      onFilePressed: () => _pickFromFile('8a_document'),
                    ),
                    const SizedBox(height: 12),
                    DocumentCard(
                      title: 'Bank Passbook',
                      status: _documentStatus['bank_passbook']!,
                      isUploaded: _documentStatus['bank_passbook'] != 'Pending',
                      onCameraPressed: () => _pickFromCamera('bank_passbook'),
                      onFilePressed: () => _pickFromFile('bank_passbook'),
                    ),
                    const SizedBox(height: 24),
                    // Custom Documents
                    ..._customDocuments.asMap().entries.map((entry) {
                      final index = entry.key;
                      final doc = entry.value;
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: DocumentCard(
                          title: doc['name'],
                          status: doc['status'],
                          isUploaded: doc['status'] != 'Pending',
                          onCameraPressed: () {
                            setState(() {
                              _customDocuments[index]['status'] = 'Uploaded';
                            });
                          },
                          onFilePressed: () {
                            setState(() {
                              _customDocuments[index]['status'] = 'Uploaded';
                            });
                          },
                        ),
                      );
                    }),
                    // Add Other Document Section
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: AppColors.borderLight),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Add Other Document',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              const Icon(Icons.insert_drive_file_outlined, 
                                  size: 20, color: AppColors.textHint),
                              const SizedBox(width: 12),
                              Expanded(
                                child: TextField(
                                  controller: _customDocNameController,
                                  decoration: const InputDecoration(
                                    hintText: 'Document Name',
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(color: AppColors.textHint),
                                    contentPadding: EdgeInsets.zero,
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: _addCustomDocument,
                                icon: const Icon(Icons.add_circle_outline,
                                    color: AppColors.primary),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Expanded(
                                child: OutlinedButton.icon(
                                  onPressed: () {},
                                  icon: Icon(Icons.camera_alt_outlined,
                                      size: 18, color: AppColors.textHint),
                                  label: Text('Camera',
                                      style: TextStyle(color: AppColors.textHint)),
                                  style: OutlinedButton.styleFrom(
                                    side: BorderSide(color: AppColors.borderLight),
                                    padding: const EdgeInsets.symmetric(vertical: 12),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: OutlinedButton.icon(
                                  onPressed: () {},
                                  icon: Icon(Icons.insert_drive_file_outlined,
                                      size: 18, color: AppColors.textHint),
                                  label: Text('File',
                                      style: TextStyle(color: AppColors.textHint)),
                                  style: OutlinedButton.styleFrom(
                                    side: BorderSide(color: AppColors.borderLight),
                                    padding: const EdgeInsets.symmetric(vertical: 12),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
            // Continue Button
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: AppColors.white,
              ),
              child: PrimaryButton(
                text: 'Continue',
                onPressed: _continue,
                isLoading: _isLoading,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
