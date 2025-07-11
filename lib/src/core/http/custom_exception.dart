class CustomException implements Exception {
  CustomException([this._message, this._prefix, this.statusCode]);

  final dynamic _message;
  final String? _prefix;
  final int? statusCode;

  String get message => _message?.toString() ?? 'Unknown error';

  @override
  String toString() {
    return "[$statusCode] $_prefix: $message";
  }
}

class FetchDataException extends CustomException {
  FetchDataException([String? message, int? statusCode]) : super(message, "Error During Communication: ", statusCode);
}

class NoInternetException extends CustomException {
  NoInternetException([String? message, int? statusCode]) : super(message, "No Internet Connection", statusCode);
}

class BadRequestException extends CustomException {
  BadRequestException([String? message, int? statusCode]) : super(message, "Invalid Request", statusCode);
}

class ResourceNotFoundException extends CustomException {
  ResourceNotFoundException([String? message, int? statusCode])
    : super(message, "Resource not found.Error code  404 ", statusCode);
}

class UnauthorizedException extends CustomException {
  UnauthorizedException([String? message, int? statusCode]) : super(message, "Unauthorised ", statusCode);
}

class ForbiddenException extends CustomException {
  ForbiddenException([String? message, int? statusCode]) : super(message, "Forbidden  ", statusCode);
}

class InternalServerErrorException extends CustomException {
  InternalServerErrorException([String? message, int? statusCode]) : super(message, "Server error ", statusCode);
}

class InvalidInputException extends CustomException {
  InvalidInputException([String? message, int? statusCode]) : super(message, "Invalid Input ", statusCode);
}
