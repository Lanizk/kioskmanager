
class Failure{

  final String message;
  final String? code;

  Failure(this.message,{this.code});

  Failure.auth(this.message,{this.code});
  Failure.network([this.message = "Network error occurred."]): code = "NETWORK_ERROR";
  Failure.firestore(this.message, {this.code});
  Failure.storage(this.message, {this.code});
  Failure.unknown([this.message = "An unknown error occurred."]): code = "UNKNOWN_ERROR";

  @override
  String toString() => "Failure(code: $code, message: $message)";
}