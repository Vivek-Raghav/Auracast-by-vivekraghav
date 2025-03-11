// Project imports:
import 'package:auracast/home/home_index.dart';
import 'package:auracast/home/presentation/pages/home_page.dart';
import 'package:auracast/injection_container/injection_initializer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injectionInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "AuraCast: Weather Insights",
      theme: lightTheme(context),
      home: const HomePage(),
    );
  }
}
