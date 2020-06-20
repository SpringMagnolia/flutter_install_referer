import 'dart:async';

import 'package:flutter/services.dart';

class FlutterInstallReferer {
  static const MethodChannel _channel =
      const MethodChannel('flutter_install_referer');


  static Future<Map<String, String>> get installReferer async {
    final Map<String, String> dataMap = await _channel.invokeMapMethod('installReferer');
    return dataMap;
  }
}
