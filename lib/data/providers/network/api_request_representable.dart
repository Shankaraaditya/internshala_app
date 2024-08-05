enum HttpMethod { get, post, put, delete }

extension HttpMethodExtension on HttpMethod {
  String get string {
    switch (this) {
      case HttpMethod.get:
        return 'GET';
      case HttpMethod.post:
        return 'POST';
      case HttpMethod.put:
        return 'PUT';
      case HttpMethod.delete:
        return 'DELETE';
      default:
        return 'GET';
    }
  }
}

class APIRequestRepresentable {
  final String url;
  final HttpMethod method;
  final Map<String, String>? headers;
  final Map<String, dynamic>? query;
  final dynamic body;

  APIRequestRepresentable({
    required this.url,
    required this.method,
    this.headers,
    this.query,
    this.body,
  });
}
