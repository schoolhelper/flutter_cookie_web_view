import 'dart:async';

import 'package:cookie_web_view/cookie_parser.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef void WebViewCreatedCallback(CookieWebViewController controller);

class CookieWebView extends StatefulWidget {
  const CookieWebView({
    Key key,
    this.onWebViewCreated,
  }) : super(key: key);

  final WebViewCreatedCallback onWebViewCreated;

  @override
  State<StatefulWidget> createState() => _CookieWebViewState();
}

class _CookieWebViewState extends State<CookieWebView> {
  @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return AndroidView(
        viewType: 'cookie_web_view',
        onPlatformViewCreated: _onPlatformViewCreated,
      );
    }
    /*if (defaultTargetPlatform == TargetPlatform.iOS) {
      return UiKitView(
        viewType: 'cookie_web_view',
        onPlatformViewCreated: _onPlatformViewCreated,
      );
    }*/
    return Text(
        '$defaultTargetPlatform is not yet supported by the text_view plugin');
  }

  void _onPlatformViewCreated(int id) {
    if (widget.onWebViewCreated == null) {
      return;
    }
    widget.onWebViewCreated(new CookieWebViewController._(id));
  }
}

class CookieWebViewController {
  MethodChannel _channel;

  final _onCookieChange = StreamController<Map<String, String>>.broadcast();

  Stream<Map<String, String>> get onCookieChange => _onCookieChange.stream;

  CookieWebViewController._(int id) {
    _channel = new MethodChannel('cookie_web_view_$id');

    _channel.setMethodCallHandler((call) {
      final String cookies = call.arguments;

      final Map<String, String> map = parseCookies(cookies);
      _onCookieChange.add(map);
      return Future.value(null);
    });
  }

  Future<void> openUrl(String url) async {
    assert(url != null);
    return _channel.invokeMethod('open', {'url': url});
  }
}
