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
  }
  List<WeatherApiResponse> apiResponse = [];
  Future<void> _onFetchWeather(
      FetchWeather event, Emitter<HomeScreenState> emit) async {
    emit(WeatherLoading());
    try {
      final result = await weatherApiUC(event.params);
      result.fold((failure) => emit(WeatherError(message: failure.toString())),
          (data) {
        apiResponse.add(data);
        emit(WeatherLoaded(weatherApiResponse: List.from(apiResponse)));
      });
    } catch (e) {
      emit(WeatherError(message: e.toString()));
    }
  }
}
