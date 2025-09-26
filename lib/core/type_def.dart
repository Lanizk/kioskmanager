import 'package:fpdart/fpdart.dart';
import 'package:kiosk_app/core/failure.dart';


typedef FutureEither<T> = Future<Either<Failure, T>>;
typedef FuturVoid = FutureEither<void>;