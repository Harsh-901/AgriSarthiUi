import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class DocumentCard extends StatelessWidget {
  final String title;
  final String status;
  final VoidCallback? onCameraPressed;
  final VoidCallback? onFilePressed;
  final bool isUploaded;

  const DocumentCard({
    super.key,
    required this.title,
    this.status = 'Pending',
    this.onCameraPressed,
    this.onFilePressed,
    this.isUploaded = false,
  });

  Color get _statusColor {
    switch (status.toLowerCase()) {
      case 'verified':
        return AppColors.success;
      case 'rejected':
        return AppColors.error;
      case 'uploaded':
        return AppColors.info;
      default:
        return AppColors.pending;
    }
  }

  IconData get _statusIcon {
    switch (status.toLowerCase()) {
      case 'verified':
        return Icons.check_circle_outline;
      case 'rejected':
        return Icons.cancel_outlined;
      case 'uploaded':
        return Icons.cloud_done_outlined;
      default:
        return Icons.schedule;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isUploaded ? AppColors.primaryLight : AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
              Row(
                children: [
                  Icon(_statusIcon, size: 16, color: _statusColor),
                  const SizedBox(width: 4),
                  Text(
                    status,
                    style: TextStyle(
                      fontSize: 14,
                      color: _statusColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: onCameraPressed,
                  icon: const Icon(Icons.camera_alt_outlined, size: 18),
                  label: const Text('Camera'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.textSecondary,
                    side: const BorderSide(color: AppColors.border),
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
                  onPressed: onFilePressed,
                  icon: const Icon(Icons.insert_drive_file_outlined, size: 18),
                  label: const Text('File'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.textSecondary,
                    side: const BorderSide(color: AppColors.border),
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
    );
  }
}
