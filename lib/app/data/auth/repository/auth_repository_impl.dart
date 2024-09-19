import 'package:dartz/dartz.dart';

import '../../../../service_locator.dart';
import '../../../domain/auth/repository/auth_repository.dart';
import '../models/user_model.dart';
import '../source/auth_firebase_service.dart';
import '../models/user_creation_model.dart';
import '../models/user_signin_model.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> getAges() async {
    return await sl<AuthFirebaseService>().getAges();
  }

  @override
  Future<Either> getUser() async {
    var user = await sl<AuthFirebaseService>().getUser();
    return user.fold((error) {
      return Left(error);
    }, (data) {
      return Right(UserModel.fromMap(data).toEntity());
    });
  }

  @override
  Future<bool> isLoggedIn() async {
    return await sl<AuthFirebaseService>().isLoggedIn();
  }

  @override
  Future<Either> sendPasswordResetEmail(String email) async {
    return await sl<AuthFirebaseService>().sendPasswordResetEmail(email);
  }

  @override
  Future<Either> signin(UserSigninModel userSigninModel) async {
    return await sl<AuthFirebaseService>().signin(userSigninModel);
  }

  @override
  Future<Either> signup(UserCreationModel userCreationModel) async {
    return await sl<AuthFirebaseService>().signup(userCreationModel);
  }
}
