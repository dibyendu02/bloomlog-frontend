import 'package:bloomlog/features/login/domain/entity/user_entity.dart';
import 'package:bloomlog/features/login/domain/repo/auth_repo.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<UserEntity> execute(String phone, String password) {
    return repository.login(phone, password);
  }
}
