// Project imports:
import 'package:auracast/home/home_index.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<HomeScreenBloc>(),
      child: const HomeScreen(),
    );
  }
}
