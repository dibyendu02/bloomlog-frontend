import 'package:bloomlog/common/view/provider/global_auth_provider.dart';
import 'package:bloomlog/common/view/viewmodel/global_auth_state.dart';
import 'package:bloomlog/common/view/viewmodel/global_auth_viewmodel.dart';
import 'package:bloomlog/features/login/presentation/viewmodels/auth_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bloomlog/core/network/dio_client.dart';
import 'package:bloomlog/core/local/hive_storage_provider.dart';
import 'package:bloomlog/features/login/data/datasources/auth_remote_datasource.dart';
import 'package:bloomlog/features/login/data/repo_impl/auth_repo_impl.dart';
import 'package:bloomlog/features/login/domain/repo/auth_repo.dart';
import 'package:bloomlog/features/login/domain/usecases/login_usecase.dart';
import 'package:bloomlog/features/login/presentation/viewmodels/auth_viewmodel.dart';

final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>((ref) {
  return AuthRemoteDataSource(ref.read(dioClientProvider).dio);
});

// Repository
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(
    ref.read(authRemoteDataSourceProvider),
    ref.read(localStorageProvider),
  );
});

// Use‑case
final loginUseCaseProvider = Provider<LoginUseCase>((ref) {
  return LoginUseCase(ref.read(authRepositoryProvider));
});

// Global Auth View‑Model
final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(
    ref.read(loginUseCaseProvider),
    ref.read(authRepositoryProvider),
  );
});

// Login Form View‑Model (screen‑local)
final loginViewModelProvider =
    StateNotifierProvider<LoginViewModel, LoginFormState>((ref) {
      return LoginViewModel(
        ref.read(globalAuthViewModelProvider.notifier),
      ); // ✅ Use global provider
    });
