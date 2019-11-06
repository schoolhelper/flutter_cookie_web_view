import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cookie_web_view/cookie_web_view.dart';

void main() {
  const MethodChannel channel = MethodChannel('cookie_web_view');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await CookieWebPlugin.platformVersion, '42');
  });
}
