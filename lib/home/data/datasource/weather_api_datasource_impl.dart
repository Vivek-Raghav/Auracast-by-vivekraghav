// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import 'package:auracast/core/const.dart';
import 'package:auracast/core/error/server_exception.dart';
import 'package:auracast/home/data/datasource/weather_api_datasource.dart';
import 'package:auracast/home/models/weather_api_response.dart';

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
