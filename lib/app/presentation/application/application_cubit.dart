import 'package:flutter_bloc/flutter_bloc.dart';

class ApplicationStates {
  final int index;

  ApplicationStates(this.index);
}

class ApplicationCubit extends Cubit<ApplicationStates> {
  ApplicationCubit() : super(ApplicationStates(0));

  void menuIndex(int index) {
    emit(ApplicationStates(index));
  }

  int getMenuIndex() => state.index;
}
