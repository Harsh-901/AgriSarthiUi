import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';

class VerifyDocumentsScreen extends StatefulWidget {
  const VerifyDocumentsScreen({super.key});

  @override
  State<VerifyDocumentsScreen> createState() => _VerifyDocumentsScreenState();
}

class _VerifyDocumentsScreenState extends State<VerifyDocumentsScreen> {
  // Placeholder pending verifications
  final List<Map<String, dynamic>> _pendingVerifications = [
    {
      'id': '1',
      'farmerName': 'Ramesh Kumar',
      'phone': '9876543210',
      'documentType': 'Aadhaar Card',
      'uploadedAt': '2 hours ago',
    },
    {
      'id': '2',
      'farmerName': 'Suresh Patil',
      'phone': '9876543211',
      'documentType': 'Land Certificate',
      'uploadedAt': '5 hours ago',
    },
    {
      'id': '3',
      'farmerName': 'Mahesh Singh',
      'phone': '9876543212',
      'documentType': '7/12 Extract',
      'uploadedAt': '1 day ago',
    },
  ];

  void _showDocumentPreview(Map<String, dynamic> verification) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.8,
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  verification['documentType'],
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Uploaded by ${verification['farmerName']}',
              style: TextStyle(color: AppColors.textSecondary),
            ),
            const SizedBox(height: 24),
            // Document Preview Placeholder
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.cardBackground,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.border),
                ),
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.description_outlined,
                        size: 64,
                        color: AppColors.textHint,
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Document Preview',
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'TODO: Load actual document',
                        style: TextStyle(
                          color: AppColors.textHint,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            // Action Buttons
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                      _rejectDocument(verification);
                    },
                    icon: const Icon(Icons.close, color: AppColors.error),
                    label: const Text('Reject'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.error,
                      side: const BorderSide(color: AppColors.error),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                      _approveDocument(verification);
                    },
                    icon: const Icon(Icons.check),
                    label: const Text('Approve'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.success,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _approveDocument(Map<String, dynamic> verification) async {
    // TODO: Call AdminService.verifyDocument(approved: true)
    setState(() {
      _pendingVerifications.removeWhere((v) => v['id'] == verification['id']);
    });

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Document approved successfully'),
          backgroundColor: AppColors.success,
        ),
      );
    }
  }

  Future<void> _rejectDocument(Map<String, dynamic> verification) async {
    // Show remarks dialog
    final remarks = await showDialog<String>(
      context: context,
      builder: (context) {
        final controller = TextEditingController();
        return AlertDialog(
          title: const Text('Rejection Reason'),
          content: TextField(
            controller: controller,
            maxLines: 3,
            decoration: const InputDecoration(
              hintText: 'Enter reason for rejection',
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, controller.text),
              child: const Text('Submit'),
            ),
          ],
        );
      },
    );

    if (remarks != null) {
      // TODO: Call AdminService.verifyDocument(approved: false, remarks: remarks)
      setState(() {
        _pendingVerifications.removeWhere((v) => v['id'] == verification['id']);
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Document rejected'),
            backgroundColor: AppColors.error,
          ),
        );
      }
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
          'Verify Documents',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: _pendingVerifications.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.check_circle_outline,
                    size: 80,
                    color: AppColors.success,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'All documents verified!',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'No pending verifications',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _pendingVerifications.length,
              itemBuilder: (context, index) {
                final verification = _pendingVerifications[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.borderLight),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    leading: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: AppColors.primaryLight,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.person_outline,
                        color: AppColors.primary,
                      ),
                    ),
                    title: Text(
                      verification['farmerName'],
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 4),
                        Text(
                          verification['documentType'],
                          style: const TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Uploaded ${verification['uploadedAt']}',
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.textHint,
                          ),
                        ),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.close, color: AppColors.error),
                          onPressed: () => _rejectDocument(verification),
                        ),
                        IconButton(
                          icon: const Icon(Icons.check, color: AppColors.success),
                          onPressed: () => _approveDocument(verification),
                        ),
                      ],
                    ),
                    onTap: () => _showDocumentPreview(verification),
                  ),
                );
              },
            ),
    );
  }
}
