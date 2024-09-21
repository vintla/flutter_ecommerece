import 'package:ecommerce_app/app/common/routes/names.dart';
import 'package:ecommerce_app/app/presentation/auth/pages/signin_page.dart';
import 'package:ecommerce_app/app/presentation/splash/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PageEntity {
  String route;
  Widget page;
  dynamic blocProvider;

  PageEntity({required this.route, required this.page, this.blocProvider});
}

class AppPages {
  static final List<PageEntity> _pages = [
    PageEntity(route: AppRoutes.SPLASH_PAGE, page: const SplashPage()),
    PageEntity(route: AppRoutes.SIGNIN_PAGE, page: SigninPage())
  ];
  static List<dynamic> allBlocProviders(BuildContext context) {
    List blocProviderList = [];

    for (var pages in _pages) {
      blocProviderList.add(pages.blocProvider);
    }

    return blocProviderList;
  }

  static MaterialPageRoute generateRoute(RouteSettings settings) {
    if (settings.name != null) {
      //check route name when navigation get triggered
      var result = _pages.where((element) => element.route == settings.name);
      if (result.isNotEmpty) {
        return MaterialPageRoute(
            builder: (_) => result.first.page, settings: settings);
      }
    }
    return MaterialPageRoute(builder: (_) => SigninPage(), settings: settings);
  }
}
