class LocalStorageException implements Exception {
  LocalStorageException({required this.message, this.stackTrace});

  final String message;
  final StackTrace? stackTrace;

  @override
  String toString() {
    return message;
  }
}
