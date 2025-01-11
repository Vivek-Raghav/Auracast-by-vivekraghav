import 'package:advanceweatherapp/home/home_index.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.instance<HomeScreenBloc>(),
      child: const HomeScreen(),
    );
  }
}
