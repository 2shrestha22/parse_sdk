class ParseObject {
  ParseObject(
    this.className,
  );

  final String className;

  DateTime get createdAt => DateTime.now();
  // DateTime get updatedAt;
  // String get objectId;
}
