class ApiNetworkException implements Exception {
  ApiNetworkException({required this.message});

  String message;

  @override
  String toString() {
    return message;
  }
}
