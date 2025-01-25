// General Exception for Server Issues
class ServerException implements Exception {
  final String message;

  const ServerException(this.message);

  @override
  String toString() => message;
}

// Exception for Network Issues (e.g., no internet connection)
class NetworkException implements Exception {
  final String message;

  const NetworkException(this.message);

  @override
  String toString() => message;
}

// Exception for Parsing Issues
class ParsingException implements Exception {
  final String message;

  const ParsingException(this.message);

  @override
  String toString() => message;
}

// A catch-all exception for unexpected issues
class UnexpectedException implements Exception {
  final String message;

  const UnexpectedException(this.message);

  @override
  String toString() => message;
}
