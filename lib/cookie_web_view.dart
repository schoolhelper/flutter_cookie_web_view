import 'dart:async';

import 'package:flutter/services.dart';

class CookieWebPlugin {
  final MethodChannel _channel;

  factory CookieWebPlugin() {
    if (_instance == null) {
      const MethodChannel methodChannel =
          const MethodChannel('cookie_web_view');
      _instance = CookieWebPlugin.private(methodChannel);
    }
    return _instance;
  }

  static CookieWebPlugin _instance;

  CookieWebPlugin.private(this._channel) {
    _channel.setMethodCallHandler(_handleMessages);
  }

  final _onCookieChange = StreamController<String>.broadcast();

  Future<Null> _handleMessages(MethodCall call) async {
    _onCookieChange.add(call.arguments);
  }

  Stream<String> get onCookieChange => _onCookieChange.stream;
}
