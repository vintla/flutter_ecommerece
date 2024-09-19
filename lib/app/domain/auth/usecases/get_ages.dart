import 'package:dartz/dartz.dart';

import '../../../../service_locator.dart';
import '../../../core/usecase/usecase.dart';
import '../repository/auth_repository.dart';

class GetAgesUseCase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({dynamic params}) async {
    return await sl<AuthRepository>().getAges();
  }
}
