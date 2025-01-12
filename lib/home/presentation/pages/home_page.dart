import 'package:advanceweatherapp/home/home_index.dart';
import 'package:advanceweatherapp/injection_container/inject_blocs.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeScreenBloc>(),
      child: const HomeScreen(),
    );
  }
}
