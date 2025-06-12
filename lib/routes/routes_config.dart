import 'package:auracast/routes/app_routes.dart';
import 'package:auracast/routes/routes_index.dart';
import 'package:auracast/routes/page_transitions.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.home,
  routes: [
    GoRoute(
      path: AppRoutes.home,
      pageBuilder: (context, state) => customTransitionPage(
        context: context,
        state: state,
        child: const HomePage(),
      ),
    ),
    GoRoute(
      path: AppRoutes.citySearch,
      pageBuilder: (context, state) => customTransitionPage(
        context: context,
        state: state,
        child: const CitySearchScreen(),
      ),
    ),
  ],
);
