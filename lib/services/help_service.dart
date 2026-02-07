/// Service for help/instructional content API calls
class HelpService {
  /// Fetch instructional videos
  Future<List<Map<String, dynamic>>> fetchVideos({String? language}) async {
    // TODO: Implement API call
    throw UnimplementedError('API not connected');
  }

  /// Get video by ID
  Future<Map<String, dynamic>> getVideoById(String videoId) async {
    // TODO: Implement API call
    throw UnimplementedError('API not connected');
  }

  /// Get available languages for videos
  Future<List<String>> getVideoLanguages() async {
    // TODO: Implement API call
    throw UnimplementedError('API not connected');
  }

  /// Get FAQs
  Future<List<Map<String, dynamic>>> getFaqs({String? language}) async {
    // TODO: Implement API call
    throw UnimplementedError('API not connected');
  }
}
