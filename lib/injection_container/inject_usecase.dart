import 'package:advanceweatherapp/home/data/repository/weather_api_respository.dart';
import 'package:advanceweatherapp/home/domain/usecase/weather_api_uc.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

Future<void> injectUsecases() async {
  getIt.registerLazySingleton<WeatherApiResponseUc>(() => WeatherApiResponseUc(
      weatherApiRespository: getIt<WeatherApiRespository>()));
}
