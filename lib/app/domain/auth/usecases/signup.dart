import 'package:dartz/dartz.dart';

import '../../../../service_locator.dart';
import '../../../core/usecase/usecase.dart';
import '../../../data/auth/models/user_creation_model.dart';
import '../repository/auth_repository.dart';

class SignupUseCase implements UseCase<Either, UserCreationModel> {
  @override
  Future<Either> call({UserCreationModel? params}) async {
    return await sl<AuthRepository>().signup(params!);
  }
}
