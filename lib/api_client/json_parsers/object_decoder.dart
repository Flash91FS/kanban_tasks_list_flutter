import 'dart:convert';
import 'json_parser.dart';

mixin ObjectDecoder<T> on JsonParser<T> {
  Map<String, dynamic> decodeJsonObject(String json) {
    try {
      return jsonDecode(json) as Map<String, dynamic>;
    } on Error {
      return jsonDecode(jsonDecode(json) as String) as Map<String, dynamic>;
    }
  }
}

mixin ListDecoder<T> on JsonParser<T> {
  List<dynamic> decodeJsonList(String json) => jsonDecode(json) as List<dynamic>;
}
