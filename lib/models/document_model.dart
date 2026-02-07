enum DocumentStatus { pending, uploaded, verified, rejected }

class DocumentModel {
  final String id;
  final String type;
  final String name;
  final String? fileUrl;
  final DocumentStatus status;
  final String? remarks;
  final DateTime? uploadedAt;
  final DateTime? verifiedAt;

  DocumentModel({
    required this.id,
    required this.type,
    required this.name,
    this.fileUrl,
    this.status = DocumentStatus.pending,
    this.remarks,
    this.uploadedAt,
    this.verifiedAt,
  });

  factory DocumentModel.fromJson(Map<String, dynamic> json) {
    return DocumentModel(
      id: json['id'] ?? '',
      type: json['type'] ?? '',
      name: json['name'] ?? '',
      fileUrl: json['file_url'],
      status: DocumentStatus.values.firstWhere(
        (e) => e.name == (json['status'] ?? 'pending'),
        orElse: () => DocumentStatus.pending,
      ),
      remarks: json['remarks'],
      uploadedAt: json['uploaded_at'] != null ? DateTime.parse(json['uploaded_at']) : null,
      verifiedAt: json['verified_at'] != null ? DateTime.parse(json['verified_at']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'name': name,
      'file_url': fileUrl,
      'status': status.name,
      'remarks': remarks,
      'uploaded_at': uploadedAt?.toIso8601String(),
      'verified_at': verifiedAt?.toIso8601String(),
    };
  }
}
