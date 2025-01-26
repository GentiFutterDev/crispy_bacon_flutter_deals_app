abstract class Failure {
  final String message;

  const Failure(this.message);

  @override
  String toString() => message;
}

class ServerFailure extends Failure {
  const ServerFailure([String? message])
      : super(message ?? 'A server error occurred.');
}

class NetworkFailure extends Failure {
  const NetworkFailure([String? message])
      : super(message ?? 'A network error occurred.');
}

class ParsingFailure extends Failure {
  const ParsingFailure([String? message])
      : super(message ?? 'Failed to parse the data.');
}

class UnexpectedFailure extends Failure {
  const UnexpectedFailure([String? message])
      : super(message ?? 'An unexpected error occurred.');
}

class CacheFailure extends Failure {
  const CacheFailure([String? message])
      : super(message ?? 'An error occurred while accessing the cache.');
}

class NotFoundFailure extends Failure {
  const NotFoundFailure([String? message])
      : super(message ?? 'The requested resource was not found.');
}