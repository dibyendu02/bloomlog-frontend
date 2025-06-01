import '../../../core/network/api_client.dart';
import '../../../core/config/api_endpoints.dart';

class AuthApi {
  final ApiClient _client = ApiClient();

  Future<dynamic> login(String email, String password) async {
    final response = await _client.post(
      ApiEndpoints.login,
      data: {'email': email, 'password': password},
    );
    return response.data;
  }
}
