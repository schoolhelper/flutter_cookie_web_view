import 'package:cookie_web_view/cookie_parser.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('test cookie parse', () {
    final String jwtCookie = "jwtC=ookie";
    final String xsrfCookie = "jwtXsrf";

    final String cookies = 'JWT=$jwtCookie; XSRF-TOKEN=$xsrfCookie';

    Map<String, String> actual = parseCookies(cookies);

    expect(actual['JWT'], jwtCookie);
    expect(actual['XSRF-TOKEN'], xsrfCookie);
  });
}
