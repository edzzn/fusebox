import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:posthog_flutter/posthog_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth_notifier.g.dart';

@Riverpod(keepAlive: true)
class Auth extends _$Auth {
  final _authStateController = StreamController<Session?>.broadcast();
  final _client = Supabase.instance.client;

  @override
  Stream<Session?> build() {
    final streamSub = _client.auth.onAuthStateChange.listen((authState) async {
      final session = authState.session;
      _authStateController.add(session);

      // capture posthog event
      if (session != null) {
        await Posthog().identify(
          userId: session.user.id,
          userProperties: {'email': session.user.email ?? ''},
        );
      } else {
        await Posthog().reset();
      }
    });

    ref.onDispose(() {
      streamSub.cancel();
      _authStateController.close();
    });
    return _authStateController.stream;
  }

  Future<void> signInWithPassword(String email, String password) async {
    await _client.auth.signInWithPassword(password: password, email: email);
  }

  Future<void> signInWithOAuth(OAuthProvider provider) async {
    String? baseUrl = (kIsWeb) ? Uri.base.origin : null;
    await _client.auth.signInWithOAuth(
      provider,
      redirectTo: baseUrl,
    );
  }

  Future<void> signUp(String email, String password) async {
    await _client.auth.signUp(password: password, email: email);
  }

  Future<void> resetPassword(String email) async {
    String? baseUrl = (kIsWeb) ? Uri.base.origin : null;
    final resetUrl = baseUrl != null ? '$baseUrl/reset-password' : null;
    await _client.auth.resetPasswordForEmail(
      email,
      redirectTo: resetUrl,
    );
  }

  Future<void> updatePassword(String password) async {
    await _client.auth.updateUser(
      UserAttributes(
        password: password,
      ),
    );
  }

  Future<void> signOut() async {
    await _client.auth.signOut();
  }
}
