import 'package:equatable/equatable.dart';

abstract class PokeFailure extends Equatable {
  final int code;

  const PokeFailure(this.code);

  @override
  List<Object?> get props => [code];
}

class UnknownFailure extends PokeFailure {
  UnknownFailure() : super(0);
}
