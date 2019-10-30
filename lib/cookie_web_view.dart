import 'dart:async';

import 'package:flutter/services.dart';

class CookieWebView {
  final MethodChannel _channel;

  // Reload webview with a url
  Future<Null> openUrl(String url) async {
    await _channel.invokeMethod('openWebView', {'url': url});
  }

  factory CookieWebView() {
    if (_instance == null) {
      const MethodChannel methodChannel = const MethodChannel('cookie_web_view');
      _instance = CookieWebView.private(methodChannel);
    }
    return _instance;
  }

  static CookieWebView _instance;

  CookieWebView.private(this._channel) {
    _channel.setMethodCallHandler(_handleMessages);
  }

  Future<Null> _handleMessages(MethodCall call) async {
    print("----------- ${call}");
  }
}
