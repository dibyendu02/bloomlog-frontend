import 'package:bloomlog/features/login/data/models/login_response_model.dart';
import 'package:dio/dio.dart';

class AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSource(this.dio);

  Future<LoginResponseModel> login(String phone, String password) async {
    final response = await dio.post(
      '/auth/login',
      data: {'phone': phone, 'password': password},
    );
    return LoginResponseModel.fromJson(response.data);
  }
}
