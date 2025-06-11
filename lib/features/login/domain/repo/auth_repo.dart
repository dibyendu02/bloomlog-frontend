import 'package:bloomlog/features/login/domain/entity/user_entity.dart';

abstract class AuthRepository {
  Future<UserEntity> login(String phone, String password);
  Future<void> logout();
}
