// lib/core/router/app_router.dart
import 'package:bloomlog/features/daily_log/presentation/daily_log_screen.dart';
import 'package:bloomlog/features/home/presentation/home_screen.dart';
import 'package:bloomlog/features/insights/presentation/insights_screen.dart';
import 'package:bloomlog/features/login/presentation/views/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'route_tracker.dart';

final GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter appRouter = GoRouter(
  navigatorKey: appNavigatorKey,
  initialLocation: '/login',
  observers: [RouteTracker()],
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
      (context, state) =>
          const Scaffold(body: Center(child: Text('Page not found'))),
);
