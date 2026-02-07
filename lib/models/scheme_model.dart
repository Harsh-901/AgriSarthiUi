class SchemeModel {
  final String id;
  final String name;
  final String description;
  final List<String> eligibilityCriteria;
  final List<String> requiredDocuments;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? imageUrl;
  final String status;
  final DateTime? createdAt;

  SchemeModel({
    required this.id,
    required this.name,
    required this.description,
    required this.eligibilityCriteria,
    required this.requiredDocuments,
    this.startDate,
    this.endDate,
    this.imageUrl,
    this.status = 'active',
    this.createdAt,
  });

  factory SchemeModel.fromJson(Map<String, dynamic> json) {
    return SchemeModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      eligibilityCriteria: List<String>.from(json['eligibility_criteria'] ?? []),
      requiredDocuments: List<String>.from(json['required_documents'] ?? []),
      startDate: json['start_date'] != null ? DateTime.parse(json['start_date']) : null,
      endDate: json['end_date'] != null ? DateTime.parse(json['end_date']) : null,
      imageUrl: json['image_url'],
      status: json['status'] ?? 'active',
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'eligibility_criteria': eligibilityCriteria,
      'required_documents': requiredDocuments,
      'start_date': startDate?.toIso8601String(),
      'end_date': endDate?.toIso8601String(),
      'image_url': imageUrl,
      'status': status,
      'created_at': createdAt?.toIso8601String(),
    };
  }
}
