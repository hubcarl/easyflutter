import 'package:flutter/services.dart';



class NavigationChannel {
  static const MethodChannel methodChannel = MethodChannel('com.happy/navigation');

  static Future<String> pushRoute(route, [args]) async {
    Map<String, String> map = args == null ? {} : args;
    map.addAll({ "route" : route  });
    try {
      return await methodChannel.invokeMethod('pushRoute', map);
    } on PlatformException {
      return null;
    } on MissingPluginException {
      return 'missing';
    }
  }


  static Future<String> pushWebRoute([args]) async {
    return pushRoute('web', args);
  }

  static Future<String> pop([args]) async {
    try {
      return await methodChannel.invokeMethod('pop', args);
    } on PlatformException {
      return null;
    } on MissingPluginException {
      return 'missing';
    }
  }
}