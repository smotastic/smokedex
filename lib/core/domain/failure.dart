import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final int code;
  // Object cause;

  const Failure(this.code);

  @override
  List<Object?> get props => [code];
}

class UnknownFailure extends Failure {
  UnknownFailure() : super(0);
}
