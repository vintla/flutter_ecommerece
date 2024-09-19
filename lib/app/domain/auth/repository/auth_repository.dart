import 'package:dartz/dartz.dart';

import '../../../data/auth/models/user_creation_model.dart';
import '../../../data/auth/models/user_signin_model.dart';

abstract class AuthRepository {
  Future<Either> signup(UserCreationModel userCreationModel);
  Future<Either> signin(UserSigninModel userSigninModel);
  Future<Either> getAges();
  Future<Either> sendPasswordResetEmail(String email);
  Future<bool> isLoggedIn();
  Future<Either> getUser();
}
