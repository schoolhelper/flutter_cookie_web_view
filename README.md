# Cookie Web View
[![Pub](https://img.shields.io/pub/v/cookie_web_view.svg)](https://pub.dartlang.org/packages/cookie_web_view) 
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Actions Status](https://github.com/schoolhelper/flutter_cookie_web_view/workflows/CI/badge.svg)](https://github.com/schoolhelper/flutter_cookie_web_view/actions)

A plugin for listen real web view cookie

* The plugin does support only android at the moment

The plugin created for listening all web view cookies.
For example for implementing auth by social media into your app.

Inline WebView in flutter using [AndroidView](https://docs.flutter.io/flutter/widgets/AndroidView-class.html) and [UiKitView](https://docs.flutter.io/flutter/widgets/UiKitView-class.html)

## API
- method `openUrl(String)` for open url in a system web view; 
- And a `onCookieChange` - the stream emit the all cookies like a string
