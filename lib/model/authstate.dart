import 'user_model.dart';

abstract class Authstate{}

class Unauthenticated extends Authstate{}

class AuthLoading extends Authstate{}

class Authenticated extends Authstate{

  final UserModel user;
  Authenticated(this.user);
}

class AuthError extends Authstate{

  final String message;
  AuthError(this.message);
}

