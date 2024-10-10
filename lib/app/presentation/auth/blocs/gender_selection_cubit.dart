import 'package:flutter_bloc/flutter_bloc.dart';

class GenderSelectionCubit extends Cubit<int> {
  GenderSelectionCubit() : super(1);

  int selectedGender = 1;

  void selectGender(int i) {
    selectedGender = i;
    emit(selectedGender);
  }
}
