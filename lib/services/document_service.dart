import 'dart:io';
import '../models/document_model.dart';

/// Service for document-related API calls
class DocumentService {
  /// Upload a document
  Future<Map<String, dynamic>> uploadDocument({
    required String documentType,
    required File file,
    String? documentName,
  }) async {
    // TODO: Implement API call
    throw UnimplementedError('API not connected');
  }

  /// Get all uploaded documents
  Future<List<DocumentModel>> getDocuments() async {
    // TODO: Implement API call
    throw UnimplementedError('API not connected');
  }

  /// Get document by type
  Future<DocumentModel?> getDocumentByType(String documentType) async {
    // TODO: Implement API call
    throw UnimplementedError('API not connected');
  }

  /// Delete a document
  Future<void> deleteDocument(String documentId) async {
    // TODO: Implement API call
    throw UnimplementedError('API not connected');
  }

  /// Get document upload status
  Future<Map<String, String>> getDocumentStatus() async {
    // TODO: Implement API call
    throw UnimplementedError('API not connected');
  }
}
