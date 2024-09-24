import 'package:ecommerce_app/app/common/blocs/button/button_cubit.dart';
import 'package:ecommerce_app/app/common/routes/names.dart';
import 'package:ecommerce_app/app/data/auth/models/user_signin_model.dart';
import 'package:ecommerce_app/app/presentation/application/application.dart';
import 'package:ecommerce_app/app/presentation/application/application_cubit.dart';
import 'package:ecommerce_app/app/presentation/auth/pages/enter_password_page.dart';
import 'package:ecommerce_app/app/presentation/auth/pages/signin_page.dart';
import 'package:ecommerce_app/app/presentation/auth/pages/signup_page.dart';
import 'package:ecommerce_app/app/presentation/splash/blocs/splash_cubit.dart';
import 'package:ecommerce_app/app/presentation/splash/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PageEntity {
  String route;
  Widget page;
  dynamic blocProvider;

  PageEntity({required this.route, required this.page, this.blocProvider});
}

class AppPages {
  static List<PageEntity> _pages({dynamic args}) {
    return [
      PageEntity(
        route: AppRoutes.SPLASH_PAGE,
        page: const SplashPage(),
        blocProvider: BlocProvider<SplashCubit>(
            create: (_) => SplashCubit()..appStarted()),
      ),
      PageEntity(
        route: AppRoutes.SIGNIN_PAGE,
        page: SigninPage(),
        blocProvider: BlocProvider<ButtonCubit>(create: (_) => ButtonCubit()),
      ),
      PageEntity(
        route: AppRoutes.ENTER_PASSWORD_PAGE,
        page: EnterPasswordPage(
          userSigninModel: UserSigninModel(email: args.toString()),
        ),
        blocProvider: BlocProvider<ButtonCubit>(create: (_) => ButtonCubit()),
      ),
      PageEntity(
        route: AppRoutes.SIGNUP_PAGE,
        page: SignupPage(),
        blocProvider: BlocProvider(create: (_) => ButtonCubit()),
      ),
      PageEntity(
        route: AppRoutes.APPLICATION_PAGE,
        page: const Application(),
        blocProvider: BlocProvider(create: (_) => ApplicationCubit()),
      )
    ];
  }

  static List<dynamic> allBlocProviders(BuildContext context) {
    List blocProviderList = [];

    for (var pages in _pages()) {
      blocProviderList.add(pages.blocProvider);
    }

    return blocProviderList;
  }

  static MaterialPageRoute generateRoute(RouteSettings settings) {
    if (settings.name != null) {
      //check route name when navigation get triggered
      var result = _pages(args: settings.arguments)
          .where((element) => element.route == settings.name);
      if (result.isNotEmpty) {
        return MaterialPageRoute(
          builder: (_) => result.first.page,
          settings: settings,
        );
      }
    }
    return MaterialPageRoute(builder: (_) => SigninPage(), settings: settings);
  }
}
