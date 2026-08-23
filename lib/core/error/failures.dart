sealed class AppFailure {
  const AppFailure();
}

final class NetworkFailure extends AppFailure {}

final class ServerFailure extends AppFailure {}

final class UnknownFailure extends AppFailure {}
