# Cookie Web View
[![Pub](https://img.shields.io/pub/v/cookie_web_view.svg)](https://pub.dartlang.org/packages/cookie_web_view) 
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A plugin for listen real web view cookie

* The plugin does not support only android at the moment

The plugin created for listening all web view cookies.
For example for implementing auth by social media into your app.

The plugin use a AndroidView like a wrapper of system web view.

## API
- method `openUrl(String)` for open url in a system web view; 
- And a `onCookieChange` - the stream emit the all cookies like a string
