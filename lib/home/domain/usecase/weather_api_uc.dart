import 'package:advanceweatherapp/core/shared/domain/usecase/usecase.dart';
import 'package:advanceweatherapp/core/utils/generic_typedef.dart';
import 'package:advanceweatherapp/home/data/repository/weather_api_respository.dart';
import 'package:advanceweatherapp/home/models/weather_api_response.dart';

class WeatherApiResponseUc extends UseCase<WeatherApiResponse, String> {
  WeatherApiResponseUc({required this.weatherApiRespository});
  final WeatherApiRespository weatherApiRespository;
  @override
  EitherDynamic<WeatherApiResponse> call(String params) async {
    return weatherApiRespository.getWeatherData(params);
  }
}
