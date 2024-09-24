import 'package:ecommerce_app/app/common/helper/app_navigator.dart';
import 'package:ecommerce_app/app/presentation/splash/blocs/splash_cubit.dart';
import 'package:ecommerce_app/app/presentation/splash/blocs/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/config/config.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is Authenticated) {
          AppNavigator.pushReplacement(context, "/signin");
        }
        if (state is UnAuthenticated) {
          AppNavigator.pushReplacement(context, "/signin");
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: Center(
          child: Image.asset(AppImages.appLogo),
        ),
      ),
    );
  }
}
