import 'package:bloomlog/common/view/provider/global_auth_provider.dart';
import 'package:bloomlog/common/view/viewmodel/global_auth_state.dart';
import 'package:bloomlog/core/widgets/custom_text_field.dart';
import 'package:bloomlog/core/widgets/solid_button.dart';
import 'package:bloomlog/theme/app_text_styles.dart';
import 'package:bloomlog/theme/theme_provider.dart';
import 'package:bloomlog/features/login/presentation/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  bool _didListen = false; // ✅ flag to ensure listener runs once

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeMode = ref.watch(themeModeProvider);
    final isDark = themeMode == ThemeMode.dark;
    final formState = ref.watch(loginViewModelProvider);

    // ✅ listen safely only once

    ref.listen<AuthState>(globalAuthViewModelProvider, (prev, next) {
      print('🔁 AuthState changed: ${next.status}');
      if (next.status == AuthStatus.success) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Logged in successfully!')),
            );
            context.go('/');
          }
        });
      }
    });

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Welcome back', style: AppTextStyles.h1Bold),
                const SizedBox(height: 30),
                CustomTextField(
                  label: 'Phone',
                  hintText: 'Enter your phone',
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  label: 'Password',
                  hintText: 'Enter your password',
                  isPassword: true,
                  controller: passwordController,
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text('Forgot password?'),
                  ),
                ),
                const SizedBox(height: 20),
                formState.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : SolidButton(
                      text: 'Verify',
                      onPressed: () {
                        ref
                            .read(loginViewModelProvider.notifier)
                            .submit(
                              phoneController.text,
                              passwordController.text,
                            );
                      },
                    ),
                if (formState.error != null) ...[
                  const SizedBox(height: 16),
                  Text(
                    formState.error!,
                    style: const TextStyle(color: Colors.red),
                  ),
                ],
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don’t have an account? "),
                    GestureDetector(
                      onTap: () => context.go('/signup'),
                      child: const Text('Sign Up', style: AppTextStyles.link),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
