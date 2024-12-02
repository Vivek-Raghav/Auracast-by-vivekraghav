import 'package:advanceweatherapp/core/const.dart';
import 'package:advanceweatherapp/core/error/server_exception.dart';
import 'package:advanceweatherapp/data/datasource/weather_api_datasource.dart';
import 'package:advanceweatherapp/data/models/weather_api_response.dart';
import 'package:dio/dio.dart';

class WeatherApiDatasourceImpl implements WeatherApiDatasource {
  Dio dio = Dio();
  @override
  Future<WeatherApiResponse> getWeatherData(String params) async {
    try {
      final pathUrl =
          "https://api.openweathermap.org/data/2.5/weather?q=$params&appid=$token";

      final response = await dio.get(pathUrl);
      if (response.statusCode == 200) {
        return WeatherApiResponse.fromJson(response.data);
      } else {
        throw ServerException(error: "Failed to fetch weather data");
      }
    } catch (e) {
      throw ServerException(error: e.toString());
    }
  }
}
