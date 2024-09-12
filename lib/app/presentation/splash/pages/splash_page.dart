import 'package:flutter/material.dart';
import '../../../core/config/config.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Image.asset(AppImages.appLogo),
      ),
    );
  }
}
