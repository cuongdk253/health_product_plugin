import 'dart:async';

import 'package:flutter/services.dart';

class PluginHeathProduct {
  static const MethodChannel _channel =
      const MethodChannel('plugin_heath_product');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<Null> showMyToast(String msg) async {
    Map<String, dynamic> args = {"msg": msg};
    await _channel.invokeMethod('showToast', args);
    return null;
  }

  static Future<Null> get openPage async {
    await _channel.invokeMethod('openPage');
    return null;
  }
}
