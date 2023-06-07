abstract class Failure {
  final String? message;
  Failure({this.message});
}

class FetchFailure extends Failure {
  FetchFailure({String? message}) : super(message: message);
}
