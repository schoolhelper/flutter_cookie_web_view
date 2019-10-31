import 'dart:async';

import 'package:flutter/services.dart';

class CookieWebView {
  final MethodChannel _channel;

  Future<Null> openUrl(String url) async {
    await _channel.invokeMethod('openWebView', {'url': url});
  }

  Future<Null> close() async {
    await _channel.invokeMethod('closeWebView');
  }

  factory CookieWebView() {
    if (_instance == null) {
      const MethodChannel methodChannel =
          const MethodChannel('cookie_web_view');
      _instance = CookieWebView.private(methodChannel);
    }
    return _instance;
  }

  static CookieWebView _instance;

  CookieWebView.private(this._channel) {
    _channel.setMethodCallHandler(_handleMessages);
  }

  final _onCookieChange = StreamController<String>.broadcast();

  Future<Null> _handleMessages(MethodCall call) async {
    _onCookieChange.add(call.arguments);
  }

  Stream<String> get onCookieChange => _onCookieChange.stream;
}
