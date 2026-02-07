import '../models/notification_model.dart';

/// Service for notification-related API calls
class NotificationService {
  /// Fetch all notifications
  Future<List<NotificationModel>> fetchNotifications() async {
    // TODO: Implement API call
    throw UnimplementedError('API not connected');
  }

  /// Mark notification as read
  Future<void> markAsRead(String notificationId) async {
    // TODO: Implement API call
    throw UnimplementedError('API not connected');
  }

  /// Mark all notifications as read
  Future<void> markAllAsRead() async {
    // TODO: Implement API call
    throw UnimplementedError('API not connected');
  }

  /// Get unread notification count
  Future<int> getUnreadCount() async {
    // TODO: Implement API call
    throw UnimplementedError('API not connected');
  }

  /// Delete notification
  Future<void> deleteNotification(String notificationId) async {
    // TODO: Implement API call
    throw UnimplementedError('API not connected');
  }
}
