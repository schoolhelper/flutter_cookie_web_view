import 'package:cookie_web_view/cookie_web_view.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cookieWebView = CookieWebView();
    cookieWebView
        .openUrl('https://remark42.radio-t.com/auth/github/login?&site=radiot');

    cookieWebView.onCookieChange.listen((cookie) {
      print("test $cookie");
      if (cookie.contains("JWT")) {
        print("test in if");
        cookieWebView.close();
      }
    });

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Running on'),
        ),
      ),
    );
  }
}
