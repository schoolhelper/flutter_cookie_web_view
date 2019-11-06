# cookie_web_view

A plugin for listen real web view cookie

* The plugin does not support only android at the moment

The plugin created for listening all web view cookies.
For example for implementing auth by social media into your app.

The plugin use a AndroidView like a wrapper of system web view.

## API
- method `openUrl(String)` for open url in a system web view; 
- And a `onCookieChange` - the stream emit the all cookies like a string