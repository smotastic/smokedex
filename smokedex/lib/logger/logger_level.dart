// part of 'logger.dart';
import 'package:enume/enume.dart';

part 'logger_level.g.dart';

@Enume()
enum Level { verbose, debug, info, warning, error, wtf, nothing }
