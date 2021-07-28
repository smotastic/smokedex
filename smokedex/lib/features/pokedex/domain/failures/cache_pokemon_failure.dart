import 'package:smokedex/core/domain/failure.dart';

class CachePokemonFailure extends Failure {
  CachePokemonFailure.args(List<String> args) : super(1000, args: args);
  CachePokemonFailure() : super(1000);
}
