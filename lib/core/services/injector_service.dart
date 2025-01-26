import 'package:get_it/get_it.dart';
import '../../features/auth/auth.dart';
import '../../features/salon/salon.dart';
import 'prefs_service.dart';
import 'dio_consumer.dart';

final getIt = GetIt.instance;

void configureDependencies() {
  getIt.registerLazySingleton(() => DioConsumer());
  getIt.registerLazySingleton(() => PrefsService());
  getIt.registerLazySingleton(() => AuthRepository());
  getIt.registerLazySingleton(() => SalonRepository());
}

DioConsumer get dioService => getIt<DioConsumer>();
PrefsService get prefsService => getIt<PrefsService>();
AuthRepository get authRepository => getIt<AuthRepository>();
SalonRepository get homeRepository => getIt<SalonRepository>();
