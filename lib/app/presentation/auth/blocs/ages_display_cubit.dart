import 'package:ecommerce_app/app/domain/auth/usecases/get_ages.dart';
import 'package:ecommerce_app/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'ages_display_states.dart';

class AgesDisplayCubit extends Cubit<AgesDisplayStates> {
  AgesDisplayCubit() : super(AgesLoadingState());

  void displayAges() async {
    var data = await sl<GetAgesUseCase>().call();

    data.fold((message) {
      emit(AgesLoadingFailureState(message: message));
    }, (data) {
      emit(AgesLoadedState(ages: data));
    });
  }
}
