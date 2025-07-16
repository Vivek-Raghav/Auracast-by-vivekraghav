// Project imports:
import 'package:auracast/core/local_db/local_cache.dart';
import 'package:auracast/core/services/weather_data_service.dart';
import 'package:auracast/injection_container/injection_index.dart';

final GetIt getIt = GetIt.instance;

Future<void> injectBlocs() async {
  getIt.registerLazySingleton<WeatherDataService>(
    () => WeatherDataService(getIt<LocalCache>()),
  );

  // Register HomeScreenBloc with WeatherDataService
  getIt.registerSingleton<HomeScreenBloc>(
    HomeScreenBloc(getIt<WeatherApiResponseUc>(), getIt<WeatherDataService>()),
  );
}
