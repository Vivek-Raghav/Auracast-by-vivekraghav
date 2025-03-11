// Project imports:
import 'package:auracast/home/home_index.dart';
import 'package:auracast/injection_container/inject_blocs.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<HomeScreenBloc>()),
      ],
      child: const HomeScreen(),
    );
  }
}
