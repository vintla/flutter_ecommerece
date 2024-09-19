import '../../../../service_locator.dart';
import '../../../core/usecase/usecase.dart';
import '../repository/auth_repository.dart';

class IsLoggedInUseCase implements UseCase<bool, dynamic> {
  @override
  Future<bool> call({params}) async {
    return await sl<AuthRepository>().isLoggedIn();
  }
}
