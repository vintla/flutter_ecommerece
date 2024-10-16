import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'button_state.dart';
import '../../../core/usecase/usecase.dart';

class ButtonCubit extends Cubit<ButtonState> {
  ButtonCubit() : super(ButtonInitialState(isActive: false));

  void disable() => emit(ButtonInitialState(isActive: false));
  void enable() => emit(ButtonInitialState(isActive: true));

  Future<void> execute({dynamic params, required UseCase useCase}) async {
    emit(ButtonLoadingState());
    try {
      Either data = await useCase.call(params: params);
      data.fold(
        (error) {
          emit(
            ButtonFailureState(errorMessage: error.toString()),
          );
        },
        (data) {
          emit(ButtonSuccessState());
        },
      );
    } catch (e) {
      emit(ButtonFailureState(errorMessage: e.toString()));
    }
  }
}
