// lib/core/router/route_tracker.dart
import 'package:flutter/widgets.dart';

String? previousRoute;

class RouteTracker extends NavigatorObserver {
  @override
  void didPush(Route route, Route? previousRoute_) {
    previousRoute = previousRoute_?.settings.name;
    debugPrint('Navigated from $previousRoute to ${route.settings.name}');
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    debugPrint(
      'Route replaced: ${oldRoute?.settings.name} → ${newRoute?.settings.name}',
    );
  }
}
