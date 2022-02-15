class ExceptionHandler implements Exception {
  final _message;
  final _prefix;
  ExceptionHandler([this._message, this._prefix]);
  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends ExceptionHandler {
  FetchDataException(String message)
      : super(message, "Error During Communication: ");
}
class BadRequestException extends ExceptionHandler {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}
class UnauthorisedException extends ExceptionHandler {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}
class InvalidInputException extends ExceptionHandler {
  InvalidInputException(String message) : super(message, "Invalid Input: ");
}