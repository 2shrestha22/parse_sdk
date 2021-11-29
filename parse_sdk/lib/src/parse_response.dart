/// Abstract class with some filed that all ParseResponse contains
///
/// You can extend this class to create a new class
abstract class ParseResponse {
  final String objectId;
  final DateTime createdAt;
  final DateTime updatedAt;

  /// Abstract class with some filed that all ParseResponse contains
  ParseResponse({
    required this.objectId,
    required this.createdAt,
    required this.updatedAt,
  });
}
