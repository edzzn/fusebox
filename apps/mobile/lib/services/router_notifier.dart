import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../screens/details_screen.dart';
import '../screens/home_screen.dart';

part 'router_notifier.g.dart';

final navigatorKey = GlobalKey<NavigatorState>();

@riverpod
GoRouter router(RouterRef ref) {
  return GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: '/',
    routes: [
      GoRoute(
        name: 'home',
        path: '/',
        builder: (context, state) => const HomeScreen(title: 'Flutter Demo Home Page'),
      ),
      GoRoute(
        name: 'details',
        path: '/test/details/:id',
        builder: (context, state) => DetailsPage(id: state.pathParameters['id']!),
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('Error: ${state.error}'),
      ),
    ),
  );
}
