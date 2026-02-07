import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  // Placeholder notifications
  final List<Map<String, dynamic>> _notifications = [
    {
      'id': '1',
      'title': 'Application Approved',
      'message': 'Your application for PM Kisan Samman Nidhi has been approved.',
      'time': '2 hours ago',
      'isRead': false,
      'type': 'success',
    },
    {
      'id': '2',
      'title': 'Document Verified',
      'message': 'Your Aadhaar card has been verified successfully.',
      'time': '1 day ago',
      'isRead': true,
      'type': 'info',
    },
    {
      'id': '3',
      'title': 'New Scheme Available',
      'message': 'A new scheme "Kisan Credit Card" is now available for you.',
      'time': '2 days ago',
      'isRead': true,
      'type': 'info',
    },
    {
      'id': '4',
      'title': 'Payment Received',
      'message': 'You have received ₹2000 as the first installment.',
      'time': '1 week ago',
      'isRead': true,
      'type': 'success',
    },
  ];

  Color _getTypeColor(String type) {
    switch (type) {
      case 'success':
        return AppColors.success;
      case 'warning':
        return AppColors.warning;
      case 'error':
        return AppColors.error;
      default:
        return AppColors.info;
    }
  }

  IconData _getTypeIcon(String type) {
    switch (type) {
      case 'success':
        return Icons.check_circle_outline;
      case 'warning':
        return Icons.warning_amber_outlined;
      case 'error':
        return Icons.error_outline;
      default:
        return Icons.info_outline;
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
          'Notifications',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              // TODO: Call NotificationService.markAllAsRead()
              setState(() {
                for (var notification in _notifications) {
                  notification['isRead'] = true;
                }
              });
            },
            child: const Text(
              'Mark all read',
              style: TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
      body: _notifications.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.notifications_off_outlined,
                    size: 80,
                    color: AppColors.textHint,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No notifications yet',
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _notifications.length,
              itemBuilder: (context, index) {
                final notification = _notifications[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: notification['isRead']
                        ? AppColors.white
                        : AppColors.primaryLight,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.borderLight),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    leading: Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: _getTypeColor(notification['type']).withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        _getTypeIcon(notification['type']),
                        color: _getTypeColor(notification['type']),
                      ),
                    ),
                    title: Text(
                      notification['title'],
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: notification['isRead']
                            ? FontWeight.normal
                            : FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 4),
                        Text(
                          notification['message'],
                          style: TextStyle(
                            fontSize: 13,
                            color: AppColors.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          notification['time'],
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.textHint,
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      // TODO: Handle notification tap
                      setState(() {
                        notification['isRead'] = true;
                      });
                    },
                  ),
                );
              },
            ),
    );
  }
}
