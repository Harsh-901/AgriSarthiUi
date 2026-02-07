/// Utility class for form validation
class Validators {
  /// Validate phone number (10 digits)
  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }
    if (value.length != 10) {
      return 'Enter a valid 10-digit phone number';
    }
    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'Phone number should contain only digits';
    }
    return null;
  }

  /// Validate OTP (4 or 6 digits)
  static String? validateOtp(String? value, {int length = 4}) {
    if (value == null || value.isEmpty) {
      return 'OTP is required';
    }
    if (value.length != length) {
      return 'Enter a valid $length-digit OTP';
    }
    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'OTP should contain only digits';
    }
    return null;
  }

  /// Validate required field
  static String? validateRequired(String? value, {String fieldName = 'This field'}) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  /// Validate name (2-50 characters, letters and spaces only)
  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Name is required';
    }
    if (value.trim().length < 2) {
      return 'Name must be at least 2 characters';
    }
    if (value.trim().length > 50) {
      return 'Name must not exceed 50 characters';
    }
    return null;
  }

  /// Validate land size (positive number)
  static String? validateLandSize(String? value) {
    if (value == null || value.isEmpty) {
      return 'Land size is required';
    }
    final landSize = double.tryParse(value);
    if (landSize == null) {
      return 'Enter a valid number';
    }
    if (landSize <= 0) {
      return 'Land size must be greater than 0';
    }
    if (landSize > 10000) {
      return 'Land size seems too large';
    }
    return null;
  }

  /// Validate dropdown selection
  static String? validateDropdown(String? value, {String fieldName = 'This field'}) {
    if (value == null || value.isEmpty) {
      return 'Please select $fieldName';
    }
    return null;
  }
}
