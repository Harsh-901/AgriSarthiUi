import '../models/scheme_model.dart';

/// Service for scheme-related API calls
class SchemeService {
  /// Get all available schemes
  Future<List<SchemeModel>> getSchemes() async {
    // TODO: Implement API call
    throw UnimplementedError('API not connected');
  }

  /// Get scheme by ID
  Future<SchemeModel> getSchemeById(String schemeId) async {
    // TODO: Implement API call
    throw UnimplementedError('API not connected');
  }

  /// Apply for a scheme
  Future<Map<String, dynamic>> applyScheme({
    required String schemeId,
    required String otp,
  }) async {
    // TODO: Implement API call
    throw UnimplementedError('API not connected');
  }

  /// Get applied schemes
  Future<List<SchemeModel>> getAppliedSchemes() async {
    // TODO: Implement API call
    throw UnimplementedError('API not connected');
  }

  /// Get scheme application status
  Future<Map<String, dynamic>> getApplicationStatus(String applicationId) async {
    // TODO: Implement API call
    throw UnimplementedError('API not connected');
  }

  /// Check scheme eligibility
  Future<Map<String, dynamic>> checkEligibility(String schemeId) async {
    // TODO: Implement API call
    throw UnimplementedError('API not connected');
  }
}
