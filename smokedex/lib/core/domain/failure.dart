import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final int code;
  final List<String> args;

  const Failure(this.code, {this.args = const []});

  @override
  List<Object?> get props => [code];
}

class UnknownFailure extends Failure {
  UnknownFailure() : super(0);
}
