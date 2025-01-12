import 'package:advanceweatherapp/injection_container/injection_index.dart';

final GetIt getIt = GetIt.instance;

Future<void> injectUsecases() async {
  getIt.registerLazySingleton<WeatherApiResponseUc>(() => WeatherApiResponseUc(
      weatherApiRespository: getIt<WeatherApiRespository>()));
}
