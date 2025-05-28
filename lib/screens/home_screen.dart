import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../theme/theme_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    final isDark = themeMode == ThemeMode.dark;

    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: SwitchListTile(
          title: Text(isDark ? "Dark Mode" : "Light Mode"),
          value: isDark,
          onChanged: (value) {
            ref.read(themeModeProvider.notifier).state =
                value ? ThemeMode.dark : ThemeMode.light;
          },
        ),
      ),
    );
  }
}
