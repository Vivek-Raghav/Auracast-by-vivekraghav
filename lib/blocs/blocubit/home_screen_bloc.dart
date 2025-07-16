// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:auracast/blocs/event/home_screen_event.dart';
import 'package:auracast/blocs/state/home_screen_state.dart';
import 'package:auracast/home/domain/usecase/weather_api_uc.dart';
import 'package:auracast/home/models/weather_api_response.dart';
import 'package:auracast/core/services/weather_data_service.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  final WeatherApiResponseUc weatherApiUC;
  final WeatherDataService _weatherDataService;
  List<String> savedCities = [];
  List<WeatherApiResponse> apiResponse = [];
  int currentWeatherIndex = 0;

  HomeScreenBloc(this.weatherApiUC, this._weatherDataService)
      : super(HomeScreenInitial()) {
    on<FetchWeather>(_onFetchWeather);
    on<UpdateWeather>(_onUpdateWeather);
    on<DeleteWeather>(_onDeleteWeather);
    on<ChangeCurrentWeatherIndex>(_onChangeCurrentIndex);
    on<LoadSavedData>(_onLoadSavedData);
    on<SaveCurrentData>(_onSaveCurrentData);
  }

  // Load saved data on app start
  Future<void> _onLoadSavedData(
      LoadSavedData event, Emitter<HomeScreenState> emit) async {
    emit(WeatherLoading());
    try {
      // Load saved cities
      savedCities = await _weatherDataService.loadSavedCities();

      // If no saved cities, add default city
      if (savedCities.isEmpty) {
        final defaultCity = await _weatherDataService.loadDefaultCity();
        savedCities.add(defaultCity);
        await _weatherDataService.saveSavedCities(savedCities);
      }

      // Check if cached weather data is valid
      final isDataValid = await _weatherDataService.isCachedDataValid();

      if (isDataValid) {
        // Load cached weather data
        apiResponse = await _weatherDataService.loadWeatherData();
        emit(WeatherLoaded(
          weatherApiResponse: List.from(apiResponse),
          currentWeatherIndex: currentWeatherIndex,
        ));
      } else {
        // Fetch fresh data for all saved cities
        // await _fetchAllSavedCities(emit);
      }
    } catch (e) {
      emit(WeatherError(message: e.toString()));
    }
  }

  // Save current data
  Future<void> _onSaveCurrentData(
      SaveCurrentData event, Emitter<HomeScreenState> emit) async {
    try {
      await _weatherDataService.saveWeatherData(apiResponse);
      await _weatherDataService.saveSavedCities(savedCities);
    } catch (e) {
      print('Error saving data: $e');
    }
  }

  Future<void> _onFetchWeather(
      FetchWeather event, Emitter<HomeScreenState> emit) async {
    emit(WeatherLoading());
    try {
      final result = await weatherApiUC(event.params);
      result.fold(
        (failure) => emit(WeatherError(message: failure.toString())),
        (data) {
          // Add city to saved cities if not already present
          if (!savedCities.contains(event.params)) {
            savedCities.add(event.params);
          }

          apiResponse.add(data);
          emit(WeatherLoaded(
            weatherApiResponse: List.from(apiResponse),
            currentWeatherIndex: currentWeatherIndex,
          ));

          // Save data after successful fetch
          add(SaveCurrentData());
        },
      );
    } catch (e) {
      emit(WeatherError(message: e.toString()));
    }
  }

  Future<void> _onUpdateWeather(
      UpdateWeather event, Emitter<HomeScreenState> emit) async {
    emit(WeatherLoading());
    try {
      final result = await weatherApiUC(event.params);
      result.fold(
        (failure) => emit(WeatherError(message: failure.toString())),
        (data) {
          // Update saved cities list
          if (event.index < savedCities.length) {
            savedCities[event.index] = event.params;
          }

          apiResponse[event.index] = data;
          emit(WeatherLoaded(
            weatherApiResponse: List.from(apiResponse),
            currentWeatherIndex: event.index,
          ));

          // Save data after successful update
          add(SaveCurrentData());
        },
      );
    } catch (e) {
      emit(WeatherError(message: e.toString()));
    }
  }

  Future<void> _onDeleteWeather(
      DeleteWeather event, Emitter<HomeScreenState> emit) async {
    try {
      // Remove from saved cities
      if (event.index < savedCities.length) {
        savedCities.removeAt(event.index);
      }

      apiResponse.removeAt(event.index);
      emit(WeatherLoaded(
        weatherApiResponse: List.from(apiResponse),
        currentWeatherIndex: currentWeatherIndex,
      ));

      // Save data after successful deletion
      add(SaveCurrentData());
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
        currentWeatherIndex: event.index,
      ));
    }
  }
}
