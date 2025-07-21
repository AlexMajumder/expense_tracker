import 'package:expense_tracker/app/app_colors.dart';
import 'package:expense_tracker/features/add_expense/presentation/pages/add_expense_page.dart';
import 'package:expense_tracker/features/home/presentation/pages/home_page.dart';
import 'package:expense_tracker/features/profile/presentation/pages/profile_page.dart';
import 'package:flutter/material.dart';

import '../../features/wallet/presentation/pages/wallet_page.dart';

class MainBottomNavPage extends StatefulWidget {
  const MainBottomNavPage({super.key});

  static const name = '/main-bottom-nav-screen';

  @override
  State<MainBottomNavPage> createState() => _MainBottomNavPageState();
}

class _MainBottomNavPageState extends State<MainBottomNavPage> {
  final List<Widget> _screens = [
    HomePage(),
    ProfilePage(),
    AddExpensePage(),
    WalletPage(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[3],
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
          selectedIndex: 3,
          //onDestinationSelected: 0,
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.home_outlined,size: 29,),
              selectedIcon: Icon(
                Icons.home,
                color: AppColors.themeColor,
                  size: 29,
              ),
              label: '',
            ),
            NavigationDestination(
              icon: Icon(Icons.stacked_bar_chart_outlined,size: 29,),
              selectedIcon: Icon(
                Icons.stacked_bar_chart,
                color: AppColors.themeColor,
                size: 29,
              ),
              label: '',
            ),
            NavigationDestination(
              icon: Icon(Icons.add,size: 29,),
              selectedIcon: Icon(
                Icons.add_circle_rounded,
                color: AppColors.themeColor,
                size: 29,
              ),
              label: '',
            ),
            NavigationDestination(
              icon: Icon(Icons.wallet_outlined,size: 29,),
              selectedIcon: Icon(Icons.wallet, color: AppColors.themeColor,size: 29,),
              label: '',
            ),
            NavigationDestination(
              icon: Icon(Icons.person_3_outlined,size: 29,),
              selectedIcon: Icon(Icons.person, color: AppColors.themeColor,size: 29,),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
