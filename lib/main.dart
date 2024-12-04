import 'package:advanceweatherapp/presentation/home_index.dart';
import 'package:advanceweatherapp/presentation/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
