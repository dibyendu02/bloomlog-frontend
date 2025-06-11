import 'package:bloomlog/common/view/viewmodel/global_auth_state.dart';
import 'package:bloomlog/common/view/viewmodel/global_auth_viewmodel.dart';
import 'package:bloomlog/features/login/presentation/providers/auth_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Access this anywhere: `ref.watch(globalAuthViewModelProvider)`
final globalAuthViewModelProvider =
    StateNotifierProvider<AuthNotifier, AuthState>((ref) {
      return AuthNotifier(
        ref.read(loginUseCaseProvider),
        ref.read(authRepositoryProvider),
      );
    });
