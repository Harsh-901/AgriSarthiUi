class UserModel {
  final String id;
  final String phoneNumber;
  final String fullName;
  final String state;
  final String district;
  final String village;
  final double landSize;
  final String cropType;
  final String language;
  final String? profileImageUrl;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  UserModel({
    required this.id,
    required this.phoneNumber,
    required this.fullName,
    required this.state,
    required this.district,
    required this.village,
    required this.landSize,
    required this.cropType,
    required this.language,
    this.profileImageUrl,
    this.createdAt,
    this.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? '',
      phoneNumber: json['phone_number'] ?? '',
      fullName: json['full_name'] ?? '',
      state: json['state'] ?? '',
      district: json['district'] ?? '',
      village: json['village'] ?? '',
      landSize: (json['land_size'] ?? 0).toDouble(),
      cropType: json['crop_type'] ?? '',
      language: json['language'] ?? '',
      profileImageUrl: json['profile_image_url'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'phone_number': phoneNumber,
      'full_name': fullName,
      'state': state,
      'district': district,
      'village': village,
      'land_size': landSize,
      'crop_type': cropType,
      'language': language,
      'profile_image_url': profileImageUrl,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }
}
