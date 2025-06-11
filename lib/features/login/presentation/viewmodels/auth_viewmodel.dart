import 'package:bloomlog/common/view/viewmodel/global_auth_state.dart';
import 'package:bloomlog/common/view/viewmodel/global_auth_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bloomlog/features/login/presentation/viewmodels/auth_state.dart';

class LoginViewModel extends StateNotifier<LoginFormState> {
  LoginViewModel(this._auth) : super(const LoginFormState());
  final AuthNotifier _auth;

  Future<void> submit(String phone, String password) async {
    state = state.copyWith(isLoading: true, error: null);
    await _auth.login(phone, password);

    if (_auth.state.status == AuthStatus.failure) {
      state = state.copyWith(isLoading: false, error: _auth.state.error);
    } else {
      state = state.copyWith(isLoading: false);
    }
  }
}
