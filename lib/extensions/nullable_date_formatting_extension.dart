import 'package:intl/intl.dart';

extension NullableDateFormattingExtension on DateTime? {
  String format(String format) {
    try {
      return this == null ? '' : DateFormat(format).format(this!);
    } catch (_) {
      return '';
    }
  }
}
