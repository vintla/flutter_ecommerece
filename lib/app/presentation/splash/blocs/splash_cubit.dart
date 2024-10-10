import 'package:ecommerce_app/app/presentation/splash/blocs/splash_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(DisplaySplash());

  void appStarted() async {
    await Future.delayed(const Duration(seconds: 2));
    var isLoggedIn = false;

    if (isLoggedIn) {
      emit(Authenticated());
    }
    emit(UnAuthenticated());
  }
}
