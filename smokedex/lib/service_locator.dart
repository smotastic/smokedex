import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:smokedex/core/presentation/device_segment.dart';
import 'package:smokedex/logger/logger.dart';
import 'service_locator.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
const mobile = const Environment(DeviceSegment.mobile);
const web = const Environment(DeviceSegment.web);

const moor = const Environment('moor');
const sqlite = const Environment('sqlite');
const memory = const Environment('memory');
const hive = const Environment('hive');

Future<void> configureDependencies(Set<String> environments) async {
  Logger.I.i('Environments for DI: $environments');
  $initGetIt(getIt, environmentFilter: NoEnvOrContainsAny(environments));
}
