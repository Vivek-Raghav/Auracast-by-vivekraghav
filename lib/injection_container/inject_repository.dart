import 'package:advanceweatherapp/injection_container/injection_index.dart';

final GetIt getIt = GetIt.instance;

Future<void> injectRepositories() async {
  getIt.registerLazySingleton<WeatherApiRespository>(() =>
      WeatherApiRespositoryImpl(
          weatherApiDatasource: getIt<WeatherApiDatasource>()));
}
