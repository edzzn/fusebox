import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:posthog_flutter/posthog_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../screens/details_screen.dart';
import '../screens/home_screen.dart';
import '../screens/auth_screen.dart';
import '../screens/forgot_password_screen.dart';
import '../services/auth_notifier.dart';

part 'router_notifier.g.dart';

final navigatorKey = GlobalKey<NavigatorState>();
Uri? initUrl = Uri.parse('/'); // Changed from Uri.base to Uri.parse('/')

@riverpod
GoRouter router(Ref ref) {
  final authState = ref.watch(authProvider);

  return GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: initUrl?.path,
    observers: [
      PosthogObserver(),
    ],
    redirect: (context, state) {
      // Handle loading state first
      if (authState.isLoading) {
        // During loading, don't redirect
        return null;
      }

      return authState.when(
        data: (user) {
          // Build initial path with query parameters
          String? path = initUrl?.path;
          final queryString = initUrl?.query.trim() ?? "";
          if (queryString.isNotEmpty && path != null) {
            path += "?$queryString";
          }

          final isAuthRoute = state.matchedLocation == '/auth' || state.matchedLocation == '/forgot-password';

          // If user is not authenticated and trying to access protected route
          if (user == null && !isAuthRoute) {
            return '/auth';
          }

          // If user is authenticated and trying to access auth routes
          if (user != null && isAuthRoute) {
            return '/';
          }

          // Clear initUrl after handling initial redirection
          initUrl = null;
          // Return null to indicate no redirection is needed
          return null;
        },
        error: (_, __) => '/auth',
        loading: () => null, // Don't redirect during loading
      );
    },
    routes: [
      GoRoute(
        name: 'home',
        path: '/',
        builder: (context, state) => const HomeScreen(title: 'Fusebox'),
      ),
      GoRoute(
        name: 'details',
        path: '/test/details/:id',
        builder: (context, state) => DetailsPage(id: state.pathParameters['id']!),
      ),
      GoRoute(
        name: 'auth',
        path: '/auth',
        builder: (context, state) => const AuthScreen(),
      ),
      GoRoute(
        name: 'forgot-password',
        path: '/forgot-password',
        builder: (context, state) => const ForgotPasswordScreen(),
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('Error: ${state.error}'),
      ),
    ),
  );
}
