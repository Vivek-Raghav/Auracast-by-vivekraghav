import 'package:advanceweatherapp/home/home_index.dart';
import 'package:advanceweatherapp/home/presentation/pages/home_page.dart';
import 'package:advanceweatherapp/injection_container/injection_initializer.dart';

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
      title: 'Weather India',
      theme: lightTheme(context),
      home: const HomePage(),
    );
  }
}
