import 'package:auracast/routes/app_routes.dart';
import 'package:auracast/routes/routes_index.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.home,
  routes: [
    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: AppRoutes.citySearch,
      builder: (context, state) => const CitySearchScreen(),
    ),
  ],
);
