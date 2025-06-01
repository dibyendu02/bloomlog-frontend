import 'package:bloomlog/features/auth/presentation/login_screen.dart';
import 'package:bloomlog/features/daily_log/presentation/daily_log_screen.dart';
import 'package:bloomlog/features/home/presentation/home_screen.dart';
import 'package:bloomlog/features/insights/presentation/insights_screen.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/daily-log',
      name: 'daily_log',
      builder: (context, state) => const DailyLogScreen(),
    ),
    GoRoute(
      path: '/insights',
      name: 'insights',
      builder: (context, state) => const InsightsScreen(),
    ),
  ],
  errorBuilder:
      (context, state) => Scaffold(body: Center(child: Text('Page not found'))),
);
