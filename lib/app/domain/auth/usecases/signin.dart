import 'package:dartz/dartz.dart';

import '../../../../service_locator.dart';
import '../../../core/usecase/usecase.dart';
import '../../../data/auth/models/user_signin_model.dart';
import '../repository/auth_repository.dart';

class SigninUseCase implements UseCase<Either, UserSigninModel> {
  @override
  Future<Either> call({UserSigninModel? params}) async {
    return await sl<AuthRepository>().signin(params!);
  }
}
