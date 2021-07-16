import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:smokedex/core/presentation/device_segment.dart';
import 'service_locator.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
const mobile = const Environment(DeviceSegment.mobile);
const web = const Environment(DeviceSegment.web);

Future<void> configureDependencies(Set<String> environments) async =>
    $initGetIt(getIt, environmentFilter: NoEnvOrContainsAny(environments));
