import 'package:expense_tracker/app/app_colors.dart';
import 'package:expense_tracker/features/add_expense/presentation/pages/add_expense_page.dart';
import 'package:expense_tracker/features/profile/presentation/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/wallet/presentation/pages/wallet_page.dart';

class MainBottomNavPage extends StatefulWidget {
  final Widget child;
  const MainBottomNavPage({super.key, required this.child});

  static const name = '/main-bottom-nav-screen';

  @override
  State<MainBottomNavPage> createState() => _MainBottomNavPageState();
}

class _MainBottomNavPageState extends State<MainBottomNavPage> {
  static const List<String> _paths = [
    '/home',
    '/profile',
    '/add-expense',
    '/wallet',
    '/profile',
  ];

  int _currentIndex(String location) {
    if (location.startsWith('/home')) return 0;
    if (location.startsWith(ProfilePage.name)) return 1;
    if (location.startsWith(AddExpensePage.name)) return 2;
    if (location.startsWith(WalletPage.name)) return 3;
    if (location.startsWith(ProfilePage.name)) return 4;
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    final currentIndex = _currentIndex(location);
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: .2),
              spreadRadius: 1,
              blurRadius: 8,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: NavigationBar(
          backgroundColor: Colors.white,
          indicatorColor: Colors.transparent,
          selectedIndex: currentIndex,
          onDestinationSelected: (index) {
            context.go(_paths[index]);
          },
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.home_outlined, size: 29),
              selectedIcon: Icon(
                Icons.home,
                color: AppColors.themeColor,
                size: 29,
              ),
              label: '',
            ),
            NavigationDestination(
              icon: Icon(Icons.stacked_bar_chart_outlined, size: 29),
              selectedIcon: Icon(
                Icons.stacked_bar_chart,
                color: AppColors.themeColor,
                size: 29,
              ),
              label: '',
            ),
            NavigationDestination(
              icon: Icon(Icons.add, size: 29),
              selectedIcon: Icon(
                Icons.add_circle_rounded,
                color: AppColors.themeColor,
                size: 29,
              ),
              label: '',
            ),
            NavigationDestination(
              icon: Icon(Icons.wallet_outlined, size: 29),
              selectedIcon: Icon(
                Icons.wallet,
                color: AppColors.themeColor,
                size: 29,
              ),
              label: '',
            ),
            NavigationDestination(
              icon: Icon(Icons.person_3_outlined, size: 29),
              selectedIcon: Icon(
                Icons.person,
                color: AppColors.themeColor,
                size: 29,
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
