// Project imports:
import 'package:auracast/injection_container/injection_index.dart';

final GetIt getIt = GetIt.instance;

Future<void> injectBlocs() async {
  getIt.registerSingleton<HomeScreenBloc>(
      HomeScreenBloc(getIt<WeatherApiResponseUc>()));
}
