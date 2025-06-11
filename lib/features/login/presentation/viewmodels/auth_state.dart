class LoginFormState {
  const LoginFormState({this.isLoading = false, this.error});
  final bool isLoading;
  final String? error;

  LoginFormState copyWith({bool? isLoading, String? error}) =>
      LoginFormState(isLoading: isLoading ?? this.isLoading, error: error);
}
