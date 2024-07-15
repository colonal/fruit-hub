abstract class Failures {
  final String message;
  const Failures(this.message);
}

class ServerFailure extends Failures {
  const ServerFailure(super.message);
}
