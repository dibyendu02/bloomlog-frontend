import 'package:bloomlog/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    final isDark = themeMode == ThemeMode.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloomlog - Home'),
        actions: [
          IconButton(
            icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
            onPressed: () {
              ref.read(themeModeProvider.notifier).state =
                  isDark ? ThemeMode.light : ThemeMode.dark;
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Welcome to Bloomlog',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const Text(
              'Your personal journaling companion',
              style: TextStyle(fontSize: 16, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),

            // Theme toggle card
            Card(
              child: SwitchListTile(
                title: Text(isDark ? "Dark Mode" : "Light Mode"),
                subtitle: const Text("Toggle app theme"),
                value: isDark,
                onChanged: (value) {
                  ref.read(themeModeProvider.notifier).state =
                      value ? ThemeMode.dark : ThemeMode.light;
                },
              ),
            ),

            const SizedBox(height: 30),

            // Navigation buttons
            ElevatedButton.icon(
              onPressed: () => context.go('/daily-log'),
              icon: const Icon(Icons.edit),
              label: const Text('Start Daily Log'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.greenAccent[400],
                minimumSize: const Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 16),

            OutlinedButton.icon(
              onPressed: () => context.go('/insights'),
              icon: const Icon(Icons.analytics),
              label: const Text('View Insights'),
              style: OutlinedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const Spacer(),

            TextButton(
              onPressed: () => context.go('/login'),
              child: const Text('Go to Login'),
            ),
          ],
        ),
      ),
    );
  }
}
