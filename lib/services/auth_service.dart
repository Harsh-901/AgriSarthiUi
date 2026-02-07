/// Service for authentication-related API calls
class AuthService {
  /// Send OTP to the given phone number
  Future<Map<String, dynamic>> sendOtp(String phoneNumber) async {
    // TODO: Implement API call
    throw UnimplementedError('API not connected');
  }

  /// Verify OTP for the given phone number
  Future<Map<String, dynamic>> verifyOtp(String phoneNumber, String otp) async {
    // TODO: Implement API call
    throw UnimplementedError('API not connected');
  }

  /// Login as farmer
  Future<Map<String, dynamic>> loginAsFarmer(String phoneNumber, String otp) async {
    // TODO: Implement API call
    throw UnimplementedError('API not connected');
  }

  /// Login as admin
  Future<Map<String, dynamic>> loginAsAdmin(String phoneNumber, String otp) async {
    // TODO: Implement API call
    throw UnimplementedError('API not connected');
  }

  /// Logout current user
  Future<void> logout() async {
    // TODO: Implement API call
    throw UnimplementedError('API not connected');
  }

  /// Check if user is authenticated
  Future<bool> isAuthenticated() async {
    // TODO: Implement API call
    throw UnimplementedError('API not connected');
  }
}
