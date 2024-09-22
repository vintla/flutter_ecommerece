import 'package:ecommerce_app/app/core/config/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'common/routes/routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [...AppPages.allBlocProviders(context)],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) => MaterialApp(
          title: "eCommerce App",
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppPages.generateRoute,
          theme: AppTheme.appTheme,
        ),
      ),
    );
  }
}
