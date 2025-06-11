// lib/app.dart
import 'package:bloomlog/app_initializer/app_initializer.dart';
import 'package:bloomlog/core/router/app_router.dart';
import 'package:bloomlog/theme/theme.dart';
import 'package:bloomlog/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);

    return AppInitializer(
      child: MaterialApp.router(
        title: 'Bloomlog',
        theme: lightTheme,
        darkTheme: darkTheme,
        debugShowCheckedModeBanner: false,
        themeMode: themeMode,
        routerConfig: appRouter,
      ),
    );
  }
}
