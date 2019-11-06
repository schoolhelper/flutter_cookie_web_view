# cookie_web_view_example

```dart
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
```