import 'package:dartz/dartz.dart';

import '../../../../service_locator.dart';
import '../../../core/usecase/usecase.dart';
import '../repository/auth_repository.dart';

class SendPasswordResetEmailUseCase implements UseCase<Either, String> {
  @override
  Future<Either> call({String? params}) async {
    return await sl<AuthRepository>().sendPasswordResetEmail(params!);
  }
}
