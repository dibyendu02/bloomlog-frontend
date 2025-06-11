import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bloomlog/common/view/viewmodel/global_auth_state.dart';
import 'package:bloomlog/features/login/domain/usecases/login_usecase.dart';
import 'package:bloomlog/features/login/domain/repo/auth_repo.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier(this._loginUseCase, this._repo) : super(const AuthState());

  final LoginUseCase _loginUseCase;
  final AuthRepository _repo;

  Future<void> login(String phone, String password) async {
    state = state.copyWith(status: AuthStatus.loading, error: null);
    try {
      final user = await _loginUseCase.execute(phone, password);
      state = state.copyWith(status: AuthStatus.success, user: user);

      print("loggeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeed in");
    } catch (e) {
      state = state.copyWith(status: AuthStatus.failure, error: e.toString());
    }
  }

  Future<void> logout() async {
    await _repo.logout();
    state = const AuthState(status: AuthStatus.idle);
  }
}
