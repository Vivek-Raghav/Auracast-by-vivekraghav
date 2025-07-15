import 'package:auracast/home/presentation/pages/bottom_navigation_bar.dart';
import 'package:auracast/routes/app_routes.dart';
import 'package:auracast/routes/routes_index.dart';
import 'package:auracast/routes/page_transitions.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.bottomNavigation,
  routes: [
    GoRoute(
      path: AppRoutes.bottomNavigation,
      pageBuilder: (context, state) => customTransitionPage(
        context: context,
        state: state,
        child: const BottomNavigationBar(),
      ),
      // routes: [
      //   GoRoute(
      //     path: AppRoutes.home,
      //     pageBuilder: (context, state) => customTransitionPage(
      //       context: context,
      //       state: state,
      //       child: const HomePage(),
      //     ),
      //   ),
      // ],
    ),
    GoRoute(
      path: AppRoutes.citySearch,
      builder: (context, state) => const CitySearchScreen(),
    ),
  ],
);
