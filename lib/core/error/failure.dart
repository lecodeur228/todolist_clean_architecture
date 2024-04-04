abstract class Failure {
  final errorMessage;

  Failure({
    required this.errorMessage,
  });
}

class ServerFailure extends Failure {
  ServerFailure({required String super.errorMessage});
}

class CacheFailure extends Failure {
  CacheFailure({required String super.errorMessage});
}
