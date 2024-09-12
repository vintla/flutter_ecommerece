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
  static final List<PageEntity> _pages = [];
  static List<dynamic> allBlocProviders(BuildContext context) {
    List blocProviderList = [];

    for (var pages in _pages) {
      blocProviderList.add(pages.blocProvider);
    }

    return blocProviderList;
  }

  static MaterialPageRoute generateRoute(RouteSettings settings) {
    if (settings.name != null) {}
    return MaterialPageRoute(builder: (_) => const SplashPage());
  }
}
