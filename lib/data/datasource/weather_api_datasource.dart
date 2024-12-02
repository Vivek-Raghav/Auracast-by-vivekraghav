import 'package:advanceweatherapp/data/models/weather_api_response.dart';

abstract class WeatherApiDatasource {
  Future<WeatherApiResponse> getWeatherData(String params);
}
