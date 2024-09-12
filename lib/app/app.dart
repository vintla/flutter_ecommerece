import 'common/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // return MultiBlocProvider(
    // providers: [...AppPages.allBlocProviders(context)],
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => const MaterialApp(
        title: "eCommerce App",
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppPages.generateRoute,
      ),
    );
    // );
  }
}
