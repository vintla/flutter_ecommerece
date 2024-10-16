abstract class ButtonState {}

class ButtonInitialState extends ButtonState {
  final bool isActive;
  ButtonInitialState({required this.isActive});
}

class ButtonLoadingState extends ButtonState {}

class ButtonSuccessState extends ButtonState {}

class ButtonFailureState extends ButtonState {
  final String errorMessage;
  ButtonFailureState({required this.errorMessage});
}
