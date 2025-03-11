// Package imports:
import 'package:equatable/equatable.dart';

// Project imports:
import 'package:auracast/core/utils/generic_typedef.dart';

abstract class UseCase<Type, Params> {
  EitherDynamic<Type> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
