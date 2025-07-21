import 'package:expense_tracker/shared/pages/main_bottom_nav_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/auth/presentation/pages/splash_page.dart';

class AppRoutes {
  static final GoRouter router = GoRouter(
    initialLocation: SplashPage.name,
      routes:<GoRoute> [
        GoRoute(
          path: SplashPage.name,
          builder: (BuildContext context, GoRouterState state) {
            return SplashPage();
          },
        ),GoRoute(
          path: MainBottomNavPage.name,
          builder: (BuildContext context, GoRouterState state) {
            return MainBottomNavPage();
          },
        ),
  ]);
}
