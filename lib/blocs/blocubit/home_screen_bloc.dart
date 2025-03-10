import 'package:auracast/blocs/event/home_screen_event.dart';
import 'package:auracast/blocs/state/home_screen_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auracast/home/domain/usecase/weather_api_uc.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  final WeatherApiResponseUc weatherApiUC;

  HomeScreenBloc(this.weatherApiUC) : super(HomeScreenInitial()) {
    on<FetchWeather>(_onFetchWeather);
  }

  Future<void> _onFetchWeather(
      FetchWeather event, Emitter<HomeScreenState> emit) async {
    emit(WeatherLoading());
    try {
      final result = await weatherApiUC(event.params);
      result.fold((failure) => emit(WeatherError(message: failure.toString())),
          (weatherApiResponse) => emit(WeatherLoaded(weatherApiResponse)));
    } catch (e) {
      emit(WeatherError(message: e.toString()));
    }
  }
}
