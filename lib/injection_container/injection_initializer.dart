// Project imports:
import 'package:auracast/injection_container/injected/inject_blocs.dart';
import 'package:auracast/injection_container/injected/inject_datasource.dart';
import 'package:auracast/injection_container/injected/inject_repository.dart';
import 'package:auracast/injection_container/injected/inject_usecase.dart';
import 'package:auracast/injection_container/injected/local_cache_init.dart';
import 'package:auracast/injection_container/injection_index.dart';

final GetIt getIt = GetIt.instance;

Future<void> injectionInit() async {
  await injectDatasources();
  await injectRepositories();
  await injectUsecases();
  await injectBlocs();
  await initializeStorage();
}
