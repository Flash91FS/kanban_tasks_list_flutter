class NetworkException implements Exception {
  NetworkException({required this.message});

  final String message;

  @override
  String toString() {
    return message;
  }
}
