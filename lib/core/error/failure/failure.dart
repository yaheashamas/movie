abstract class Failure {}

class ServerFailure extends Failure {
  final String error;
  ServerFailure(this.error);
}

class NoInterNetFailure extends Failure {}

class UnknownFailure extends Failure {}
