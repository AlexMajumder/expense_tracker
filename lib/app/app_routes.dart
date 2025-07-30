import 'package:expense_tracker/shared/pages/main_bottom_nav_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/auth/presentation/pages/splash_page.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/add_expense/presentation/pages/add_expense_page.dart';
import '../../features/wallet/presentation/pages/wallet_page.dart';
import '../../features/profile/presentation/pages/profile_page.dart';
import '../features/auth/presentation/pages/login_page.dart';
import '../features/auth/presentation/pages/register_page.dart';

class AppRoutes {
  static final GoRouter router = GoRouter(
    initialLocation: SplashPage.name,
    routes: <RouteBase>[
      GoRoute(
        path: SplashPage.name,
        builder: (BuildContext context, GoRouterState state) {
          return const SplashPage();
        },
      ),
      ShellRoute(
        builder: (context, state, child) {
          return MainBottomNavPage(child: child);
        },
        routes: [
          GoRoute(
            path: '/home',
            name: HomePage.name,
            builder: (context, state) => const HomePage(),
          ),
          GoRoute(
            path: '/add-expense',
            name: AddExpensePage.name,
            builder: (context, state) => const AddExpensePage(),
          ),
          GoRoute(
            path: '/wallet',
            name: WalletPage.name,
            builder: (context, state) => const WalletPage(),
          ),
          GoRoute(
            path: '/profile',
            name: ProfilePage.name,
            builder: (context, state) => const ProfilePage(),
          ),
        ],
      ),
       GoRoute(
       path: LoginPage.name,
       name: LoginPage.name,
     builder: (context, state) => const LoginPage(),
     ),
      GoRoute(
       path: RegisterPage.name,
       name: RegisterPage.name,
     builder: (context, state) => const RegisterPage(),
     ),
    ],
  );
}
