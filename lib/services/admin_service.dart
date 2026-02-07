import '../models/scheme_model.dart';
import '../models/document_model.dart';

/// Service for admin-related API calls
class AdminService {
  /// Create a new scheme
  Future<Map<String, dynamic>> createScheme({
    required String name,
    required String description,
    required List<String> eligibilityCriteria,
    required List<String> requiredDocuments,
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    // TODO: Implement API call
    throw UnimplementedError('API not connected');
  }

  /// Update an existing scheme
  Future<Map<String, dynamic>> updateScheme(String schemeId, Map<String, dynamic> data) async {
    // TODO: Implement API call
    throw UnimplementedError('API not connected');
  }

  /// Delete a scheme
  Future<void> deleteScheme(String schemeId) async {
    // TODO: Implement API call
    throw UnimplementedError('API not connected');
  }

  /// Get all schemes for admin
  Future<List<SchemeModel>> getAllSchemes() async {
    // TODO: Implement API call
    throw UnimplementedError('API not connected');
  }

  /// Get pending verification documents
  Future<List<Map<String, dynamic>>> getPendingVerifications() async {
    // TODO: Implement API call
    throw UnimplementedError('API not connected');
  }

  /// Verify a document
  Future<Map<String, dynamic>> verifyDocument({
    required String documentId,
    required bool approved,
    String? remarks,
  }) async {
    // TODO: Implement API call
    throw UnimplementedError('API not connected');
  }

  /// Get dashboard statistics
  Future<Map<String, dynamic>> getDashboardStats() async {
    // TODO: Implement API call
    throw UnimplementedError('API not connected');
  }

  /// Get farmers list
  Future<List<Map<String, dynamic>>> getFarmers() async {
    // TODO: Implement API call
    throw UnimplementedError('API not connected');
  }
}
