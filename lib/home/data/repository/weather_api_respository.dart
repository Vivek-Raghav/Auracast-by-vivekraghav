// Project imports:
import 'package:auracast/core/utils/generic_typedef.dart';
import 'package:auracast/home/models/weather_api_response.dart';

abstract class WeatherApiRespository {
  EitherDynamic<WeatherApiResponse> getWeatherData(String params);
}
