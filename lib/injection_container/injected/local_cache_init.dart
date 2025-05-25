// Project imports:
import 'package:auracast/core/local_db/local_cache.dart';
import '../injection_initializer.dart';

Future<void> initializeStorage() async {
  // Register Storage Dependencies
  final localCache = LocalCache();
  await localCache.init();

  getIt.registerSingleton<LocalCache>(localCache);
}
