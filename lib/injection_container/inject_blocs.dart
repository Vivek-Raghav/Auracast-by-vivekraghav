import 'package:advanceweatherapp/blocs/blocubit/home_screen_bloc.dart';
import 'package:advanceweatherapp/home/domain/usecase/weather_api_uc.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

Future<void> injectBlocs() async {
  getIt.registerLazySingleton<HomeScreenBloc>(
      () => HomeScreenBloc(getIt<WeatherApiResponseUc>()));
}
