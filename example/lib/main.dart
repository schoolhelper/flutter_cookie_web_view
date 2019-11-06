import 'package:cookie_web_view/cookie_web_view.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: CookieWebView(
          onWebViewCreated: (CookieWebViewController controller) {
            controller.openUrl("https://google.com");
            controller.onCookieChange.listen((data) {
              print('cookie : $data');
            });
          },
        ),
      ),
    );
  }
}
