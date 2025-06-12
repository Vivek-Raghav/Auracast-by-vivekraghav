// Package imports:
import 'package:auracast/core/constants/global_const.dart';
import 'package:auracast/routes/routes_config.dart';
import 'package:firebase_core/firebase_core.dart';

// Project imports:
import 'package:auracast/firebase_options.dart';
import 'package:auracast/home/home_index.dart';
import 'package:auracast/injection_container/injection_initializer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await injectionInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      scaffoldMessengerKey: GlobalKeys.rootScaffoldMessengerKey,
      debugShowCheckedModeBanner: false,
      title: "AuraCast: Weather Insights",
      theme: lightTheme(context),
      routerConfig: appRouter,
    );
  }
}
