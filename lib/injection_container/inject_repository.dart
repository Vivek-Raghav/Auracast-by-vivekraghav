import 'package:advanceweatherapp/home/data/datasource/weather_api_datasource_impl.dart';
import 'package:advanceweatherapp/home/data/repository/weather_api_respository.dart';
import 'package:advanceweatherapp/home/data/repository/weather_api_respository_impl.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

Future<void> injectRepositories() async {
  getIt.registerLazySingleton<WeatherApiRespository>(() =>
      WeatherApiRespositoryImpl(
          weatherApiDatasource: WeatherApiDatasourceImpl()));
}
