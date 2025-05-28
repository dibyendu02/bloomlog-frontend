import 'package:bloomlog/screens/daily_log_screen.dart';
import 'package:bloomlog/screens/insights_screen.dart';
import 'package:bloomlog/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'theme/theme.dart';
import 'theme/theme_provider.dart';
import 'screens/home_screen.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme,
      debugShowCheckedModeBanner: false,
      darkTheme: darkTheme,
      themeMode: themeMode,

      // home: const HomeScreen(),
      // home: const LoginScreen(),
      // home: const DailyLogScreen(),
      home: const InsightsScreen(),
    );
  }
}
