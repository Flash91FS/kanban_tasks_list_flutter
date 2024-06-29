class InvalidDataException implements Exception {
  InvalidDataException({required this.data, this.message});

  final String data;
  final String? message;

  @override
  String toString() {
    return 'Invalid Data: $data. ${message ?? ''}';
  }
}
