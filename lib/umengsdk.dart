import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';

class Umengsdk {
  static const MethodChannel _channel = const MethodChannel('umengsdk');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  /// 初始化友盟
  static Future initUmeng(String appleKey, String androidKey,
      {String appleChannel = "App Store",
      String androidChannel = "Google play", bool isShowLog = false}) async {
      var arguments;
      if(Platform.isIOS){
        arguments = {"key": appleKey, "channel": appleChannel, "log": isShowLog};
      } else {
        arguments = {"key": androidKey, "channel": androidChannel, "log": isShowLog};
      }
      await _channel.invokeMethod('initUmeng', arguments);
  }
}
