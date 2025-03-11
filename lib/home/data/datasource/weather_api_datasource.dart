// Project imports:
import 'package:auracast/home/models/weather_api_response.dart';

abstract class WeatherApiDatasource {
  Future<WeatherApiResponse> getWeatherData(String params);
}
