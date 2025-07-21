import 'package:expense_tracker/features/auth/presentation/widgets/app_logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  static const name = '/splash-screen';

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    _endTheSplashScreen();
    super.initState();
  }

  Future<void> _endTheSplashScreen() async {
    await Future.delayed(const Duration(seconds: 3));
    if (mounted) {
      context.go('/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Spacer(),
          Center(child: AppLogoWidget()),
          Spacer(),
        ],
      ),
    );
  }
}
