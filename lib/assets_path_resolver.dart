import 'dart:async';

import 'package:flutter/services.dart';

class AssetsPathResolver {
  static const MethodChannel _channel =
      const MethodChannel('assets_path_resolver');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<String> resolvePath(String path) async {
    final String resolved = await _channel.invokeMethod('resolvePath', path);
    return resolved;
  }
}
