extension NullToEmptyStringExtension on String? {
  String nullToEmptyString() {
    return this ?? '';
  }
}
