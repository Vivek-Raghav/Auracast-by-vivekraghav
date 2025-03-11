// Package imports:
import "package:equatable/equatable.dart";

abstract class Failure extends Equatable {
  @override
  List<Object?> get props =>
      []; // List<Object?> allows null values for comparison.
}

// ServerFailure: handles errors related to server issues
// class ServerFailure extends Failure {
//   ServerFailure({this.error, this.errorEntity});

//   final String? error; // Error message from server
//   final ErrorEntity?
//       errorEntity; // An optional error entity for more complex errors

//   // Override props to include error and errorEntity for comparison
//   @override
//   List<Object?> get props => [error, errorEntity];

//   // Override toString to make printing the instance display the error message
//   @override
//   String toString() {
//     return error ?? "ServerFailure: An error occurred";
//   }
// }

// CacheFailure: handles errors related to cache issues (you can expand as needed)
class CacheFailure extends Failure {
  @override
  String toString() {
    return "CacheFailure: An error occurred related to cache";
  }
}

// GeneralFailure: handles general errors with a required error message
class GeneralFailure extends Failure {
  GeneralFailure({required this.error});

  final String error;

  // Override props to include the error message for comparison
  @override
  List<Object?> get props => [error];

  // Override toString to display the error message
  @override
  String toString() {
    return error;
  }
}
