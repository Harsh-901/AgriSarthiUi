import '../models/user_model.dart';

/// Service for farmer profile-related API calls
class ProfileService {
  /// Submit farmer profile details
  Future<Map<String, dynamic>> submitDetails({
    required String phoneNumber,
    required String fullName,
    required String state,
    required String district,
    required String village,
    required double landSize,
    required String cropType,
    required String language,
  }) async {
    // TODO: Implement API call
    throw UnimplementedError('API not connected');
  }

  /// Get farmer profile
  Future<UserModel> getProfile() async {
    // TODO: Implement API call
    throw UnimplementedError('API not connected');
  }

  /// Update farmer profile
  Future<Map<String, dynamic>> updateProfile(Map<String, dynamic> data) async {
    // TODO: Implement API call
    throw UnimplementedError('API not connected');
  }

  /// Get list of states
  Future<List<String>> getStates() async {
    // TODO: Implement API call
    throw UnimplementedError('API not connected');
  }

  /// Get districts for a state
  Future<List<String>> getDistricts(String state) async {
    // TODO: Implement API call
    throw UnimplementedError('API not connected');
  }

  /// Get crop types
  Future<List<String>> getCropTypes() async {
    // TODO: Implement API call
    throw UnimplementedError('API not connected');
  }
}
