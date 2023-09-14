class ApiException implements Exception {
  final String message;

  ApiException(this.message);

  @override
  String toString() => 'ApiException: $message';
}

class NetworkException implements ApiException {
  final String message;

  NetworkException(this.message);

  @override
  String toString() => 'NetworkException: $message';
}

class ServerException implements ApiException {
  final String message;

  ServerException(this.message);

  @override
  String toString() => 'ServerException: $message';
}

class BadRequestException implements ApiException {
  final String message;

  BadRequestException(this.message);

  @override
  String toString() => 'BadRequestException: $message';
}

