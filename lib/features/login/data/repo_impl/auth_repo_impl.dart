import 'package:bloomlog/core/interfaces/local_storage_service.dart';
import 'package:bloomlog/features/login/data/datasources/auth_remote_datasource.dart';
import 'package:bloomlog/features/login/domain/entity/user_entity.dart';
import 'package:bloomlog/features/login/domain/repo/auth_repo.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource dataSource;
  final LocalStorageService storage;

  AuthRepositoryImpl(this.dataSource, this.storage);

  @override
  Future<UserEntity> login(String phone, String password) async {
    final model = await dataSource.login(phone, password);

    await storage.write('access_token', model.tokens.accessToken);
    await storage.write('refresh_token', model.tokens.refreshToken);

    return UserEntity(
      id: model.user.id,
      name: model.user.name,
      phone: model.user.phone,
      profilePicUrl: model.user.profilePictureUrl,
    );
  }

  @override
  Future<void> logout() async {
    await storage.delete('access_token');
    await storage.delete('refresh_token');
  }
}
