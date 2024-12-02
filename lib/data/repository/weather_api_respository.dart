import 'package:advanceweatherapp/core/utils/generic_typedef.dart';
import 'package:advanceweatherapp/data/models/weather_api_response.dart';

abstract class WeatherApiRespository {
  EitherDynamic<WeatherApiResponse> getWeatherData(String params);
}
