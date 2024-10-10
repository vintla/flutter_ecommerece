import 'package:cloud_firestore/cloud_firestore.dart';

abstract class AgesDisplayStates {}

class AgesLoadingState extends AgesDisplayStates {}

class AgesLoadedState extends AgesDisplayStates {
  final List<QueryDocumentSnapshot<Map<String, String>>> ages;

  AgesLoadedState({required this.ages});
}

class AgesLoadingFailureState extends AgesDisplayStates {
  final String message;

  AgesLoadingFailureState({required this.message});
}
