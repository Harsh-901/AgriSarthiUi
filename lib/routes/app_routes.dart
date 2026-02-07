import 'package:flutter/material.dart';
import '../screens/splash_screen.dart';
import '../screens/language_selection_screen.dart';
import '../screens/farmer/login_screen.dart';
import '../screens/farmer/profile_form_screen.dart';
import '../screens/farmer/document_upload_screen.dart';
import '../screens/farmer/processing_screen.dart';
import '../screens/farmer/home_dashboard_screen.dart';
import '../screens/farmer/apply_summary_screen.dart';
import '../screens/farmer/notifications_screen.dart';
import '../screens/farmer/videos_screen.dart';
import '../screens/farmer/profile_screen.dart';
import '../screens/admin/admin_login_screen.dart';
import '../screens/admin/admin_dashboard_screen.dart';
import '../screens/admin/manage_schemes_screen.dart';
import '../screens/admin/verify_documents_screen.dart';

class AppRoutes {
  // Route names
  static const String splash = '/';
  static const String languageSelection = '/language-selection';
  static const String login = '/login';
  static const String profileForm = '/profile-form';
  static const String documentUpload = '/document-upload';
  static const String processing = '/processing';
  static const String homeDashboard = '/home';
  static const String applySummary = '/apply-summary';
  static const String notifications = '/notifications';
  static const String videos = '/videos';
  static const String profile = '/profile';
  static const String adminLogin = '/admin-login';
  static const String adminDashboard = '/admin-dashboard';
  static const String manageSchemes = '/manage-schemes';
  static const String verifyDocuments = '/verify-documents';

  // Route generator
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case languageSelection:
        return MaterialPageRoute(builder: (_) => const LanguageSelectionScreen());
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case profileForm:
        return MaterialPageRoute(builder: (_) => const ProfileFormScreen());
      case documentUpload:
        return MaterialPageRoute(builder: (_) => const DocumentUploadScreen());
      case processing:
        return MaterialPageRoute(builder: (_) => const ProcessingScreen());
      case homeDashboard:
        return MaterialPageRoute(builder: (_) => const HomeDashboardScreen());
      case applySummary:
        final args = settings.arguments as Map<String, dynamic>?;
        return MaterialPageRoute(
          builder: (_) => ApplySummaryScreen(schemeId: args?['schemeId'] ?? ''),
        );
      case notifications:
        return MaterialPageRoute(builder: (_) => const NotificationsScreen());
      case videos:
        return MaterialPageRoute(builder: (_) => const VideosScreen());
      case profile:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case adminLogin:
        return MaterialPageRoute(builder: (_) => const AdminLoginScreen());
      case adminDashboard:
        return MaterialPageRoute(builder: (_) => const AdminDashboardScreen());
      case manageSchemes:
        return MaterialPageRoute(builder: (_) => const ManageSchemesScreen());
      case verifyDocuments:
        return MaterialPageRoute(builder: (_) => const VerifyDocumentsScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
