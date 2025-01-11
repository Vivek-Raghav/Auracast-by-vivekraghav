import 'package:advanceweatherapp/core/error/failure.dart';
import 'package:advanceweatherapp/core/error/server_exception.dart';
import 'package:advanceweatherapp/core/utils/generic_typedef.dart';
import 'package:advanceweatherapp/home/data/datasource/weather_api_datasource.dart';
import 'package:advanceweatherapp/home/models/weather_api_response.dart';
import 'package:advanceweatherapp/home/data/repository/weather_api_respository.dart';
import 'package:dartz/dartz.dart';

class WeatherApiRespositoryImpl implements WeatherApiRespository {
  final WeatherApiDatasource weatherApiDatasource;

  WeatherApiRespositoryImpl({required this.weatherApiDatasource});
  @override
  // Assuming you have correctly set up classes and imports
  EitherDynamic<WeatherApiResponse> getWeatherData(String params) async {
    try {
      final data = await weatherApiDatasource.getWeatherData(params);
      if (data.cod == 200) {
        return Right(data);
      } else {
        return Left(
          GeneralFailure(
            error: "No data received from the server.",
          ),
        );
      }
    } on ServerException catch (e) {
      return Left(GeneralFailure(error: e.error));
    } catch (e) {
      return Left(GeneralFailure(error: "An unexpected error occurred."));
    }
  }
}
