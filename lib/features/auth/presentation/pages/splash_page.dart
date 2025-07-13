import 'package:expense_tracker/features/auth/presentation/widgets/app_logo_widget.dart';
import 'package:flutter/material.dart';
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Spacer(),
          AppLogoWidget(),
          Spacer(),

        ],
      ),
    );
  }
}
