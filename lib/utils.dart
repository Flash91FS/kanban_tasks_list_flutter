import 'package:flutter/foundation.dart';

const String TAG_UTILS = "FS - Utils - ";
const String TAG_RESPONSE = "FS - Response - ";

void logData(String tag, String data) {
  //TODO add restriction to log only for debug version
  debugPrint('$tag $data');
}