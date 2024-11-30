import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth_notifier.g.dart';

@Riverpod(keepAlive: true)
class Auth extends _$Auth {
  final StreamController<Session?> authStateController = StreamController.broadcast();

  @override
  Stream<Session?> build() {
    final streamSub = client.auth.onAuthStateChange.listen((authState) async {
      final session = authState.session;
      authStateController.add(session);
    });

    ref.onDispose(() {
      streamSub.cancel();
      authStateController.close();
    });
    return authStateController.stream;
  }

  SupabaseClient get client => Supabase.instance.client;
  Session? get currentSession => client.auth.currentSession;

  Future<void> signInWithPassword(String email, String password) async {
    await client.auth.signInWithPassword(password: password, email: email);
  }

  Future<void> signInWithOAuth(OAuthProvider provider) async {
    String? baseUrl = (kIsWeb) ? Uri.base.origin : null;
    await client.auth.signInWithOAuth(
      provider,
      redirectTo: baseUrl,
    );
  }

  Future<void> signUp(String email, String password) async {
    await client.auth.signUp(password: password, email: email);
  }

  Future<void> resetPassword(String email) async {
    String? baseUrl = (kIsWeb) ? Uri.base.origin : null;
    final resetUrl = baseUrl != null ? '$baseUrl/reset-password' : null;
    await client.auth.resetPasswordForEmail(
      email,
      redirectTo: resetUrl,
    );
  }

  Future<void> updatePassword(String password) async {
    await client.auth.updateUser(
      UserAttributes(
        password: password,
      ),
    );
  }

  Future<void> signOut() async {
    await client.auth.signOut();
  }
}
