import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopping_list/costants.dart';
import 'package:shopping_list/screens/cart_page.dart';
import 'package:shopping_list/screens/error_screen.dart';
import 'package:shopping_list/screens/home_page.dart';
import 'package:shopping_list/screens/root.dart';

final _shellRouteKey = GlobalKey<NavigatorState>();
final _routerKey = GlobalKey<NavigatorState>();

class MyRouter {
  static final router = GoRouter(
    initialLocation: "/home",
    navigatorKey: _routerKey,
    routes: [
      ShellRoute(
          navigatorKey: _shellRouteKey,
          builder: (context, state, child) => Root(child: child),
          routes: [
            GoRoute(
              path: "/home",
              name: homeRoute,
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: HomePage()),
            ),
            GoRoute(
              path: "/cart",
              name: cartRoute,
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: CartPage()),
            )
          ])
    ],
    errorBuilder: (context, state) => const ErrorScreen(),
  );
}
