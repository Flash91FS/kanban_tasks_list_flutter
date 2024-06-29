class MissingDataException implements Exception {
  MissingDataException({required this.targetData});

  final String targetData;

  @override
  String toString() {
    return 'Failed to load $targetData data';
  }
}
