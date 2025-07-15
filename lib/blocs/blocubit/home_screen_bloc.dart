// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:auracast/blocs/event/home_screen_event.dart';
import 'package:auracast/blocs/state/home_screen_state.dart';
import 'package:auracast/home/domain/usecase/weather_api_uc.dart';
import 'package:auracast/home/models/weather_api_response.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  final WeatherApiResponseUc weatherApiUC;

  HomeScreenBloc(this.weatherApiUC) : super(HomeScreenInitial()) {
    on<FetchWeather>(_onFetchWeather);
    on<UpdateWeather>(_onUpdateWeather);
    on<DeleteWeather>(_onDeleteWeather);
    on<ChangeCurrentWeatherIndex>(_onChangeCurrentIndex);
  }
  List<WeatherApiResponse> apiResponse = [];
  int currentWeatherIndex = 0;

  Future<void> _onFetchWeather(
      FetchWeather event, Emitter<HomeScreenState> emit) async {
    emit(WeatherLoading());
    try {
      final result = await weatherApiUC(event.params);
      result.fold((failure) => emit(WeatherError(message: failure.toString())),
          (data) {
        apiResponse.add(data);
        emit(WeatherLoaded(
            weatherApiResponse: List.from(apiResponse),
            currentWeatherIndex: currentWeatherIndex));
      });
    } catch (e) {
      emit(WeatherError(message: e.toString()));
    }
  }

  Future<void> _onUpdateWeather(
      UpdateWeather event, Emitter<HomeScreenState> emit) async {
    emit(WeatherLoading());
    try {
      final result = await weatherApiUC(event.params);
      result.fold((failure) => emit(WeatherError(message: failure.toString())),
          (data) {
        apiResponse[event.index] = data;
        emit(WeatherLoaded(
            weatherApiResponse: List.from(apiResponse),
            currentWeatherIndex: event.index));
      });
    } catch (e) {
      emit(WeatherError(message: e.toString()));
    }
  }

  Future<void> _onDeleteWeather(
      DeleteWeather event, Emitter<HomeScreenState> emit) async {
    try {
      apiResponse.removeAt(event.index);
      emit(WeatherLoaded(
          weatherApiResponse: List.from(apiResponse),
          currentWeatherIndex: currentWeatherIndex));
    } catch (e) {
      emit(WeatherError(message: e.toString()));
    }
  }

  void _onChangeCurrentIndex(
      ChangeCurrentWeatherIndex event, Emitter<HomeScreenState> emit) {
    if (state is WeatherLoaded) {
      currentWeatherIndex = event.index;
      final currentState = state as WeatherLoaded;
      emit(WeatherLoaded(
          weatherApiResponse: currentState.weatherApiResponse,
          currentWeatherIndex: event.index));
    }
  }
}
