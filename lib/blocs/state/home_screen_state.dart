import 'package:auracast/home/models/weather_api_response.dart';

abstract class HomeScreenState {}

class HomeScreenInitial extends HomeScreenState {}

class WeatherLoading extends HomeScreenState {}

class WeatherLoaded extends HomeScreenState {
  WeatherLoaded(this.weatherApiResponse);
  final WeatherApiResponse weatherApiResponse;
}

class WeatherError extends HomeScreenState {
  WeatherError({required this.message});
  final String message;
}
