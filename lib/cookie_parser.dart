Map<String, String> parseCookies(String cookies) {
  final map = Map<String, String>();
  cookies.split(';').forEach((cookie) {
    final int splitIndex = cookie.indexOf('=');
    final String key = cookie.substring(0, splitIndex).trim();
    final String value = cookie.substring(splitIndex + 1).trim();
    map[key] = value;
  });
  return map;
}
