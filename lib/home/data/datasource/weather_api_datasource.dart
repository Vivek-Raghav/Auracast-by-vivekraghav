import 'package:advanceweatherapp/home/models/weather_api_response.dart';

abstract class WeatherApiDatasource {
  Future<WeatherApiResponse> getWeatherData(String params);
}
