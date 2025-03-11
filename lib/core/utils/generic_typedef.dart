// Package imports:
import "package:dartz/dartz.dart";

// Project imports:
import 'package:auracast/core/error/failure.dart';

typedef EitherDynamic<T> = Future<Either<Failure, T>>;
