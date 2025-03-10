import 'package:auracast/core/error/failure.dart';
import "package:dartz/dartz.dart";

typedef EitherDynamic<T> = Future<Either<Failure, T>>;
