import 'package:auracast/injection_container/inject_blocs.dart';
import 'package:auracast/injection_container/inject_datasource.dart';
import 'package:auracast/injection_container/inject_repository.dart';
import 'package:auracast/injection_container/inject_usecase.dart';
import 'package:auracast/injection_container/injection_index.dart';

final GetIt getIt = GetIt.instance;

Future<void> injectionInit() async {
  // Ensure all modules are registered in the right order
  await injectDatasources();
  await injectRepositories();
  await injectUsecases();
  await injectBlocs();
}
