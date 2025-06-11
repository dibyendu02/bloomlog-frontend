import 'package:bloomlog/features/login/domain/entity/user_entity.dart';

enum AuthStatus { idle, loading, success, failure }

class AuthState {
  const AuthState({this.status = AuthStatus.idle, this.user, this.error});

  final AuthStatus status;
  final UserEntity? user;
  final String? error;

  bool get isAuthenticated => status == AuthStatus.success && user != null;

  AuthState copyWith({AuthStatus? status, UserEntity? user, String? error}) =>
      AuthState(
        status: status ?? this.status,
        user: user ?? this.user,
        error: error ?? this.error,
      );
}
