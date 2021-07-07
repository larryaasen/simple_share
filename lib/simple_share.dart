import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/services.dart';

class SimpleShare {
  static const MethodChannel _channel =
      const MethodChannel('com.juanito21.simpleShare/share');

  static Future<String> share(
      {String msg,
      Uint8List imageBytes,
      String uri,
      String title,
      String subject,
      String type}) async {
    final Map<String, dynamic> params = <String, dynamic>{
      'msg': msg,
      'imageBytes': imageBytes,
      'uri': uri,
      'title': title,
      'subject': subject,
      'type': type,
    };
    try {
      return await _channel.invokeMethod('share', params);
    } catch (e) {
      print(e.toString());
      return await Future<String>.value(e.toString());
    }
  }
}
