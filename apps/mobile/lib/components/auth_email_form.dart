import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../services/auth_notifier.dart';

enum AuthAction { signIn, signUp }

class AuthEmailForm extends ConsumerStatefulWidget {
  final AuthAction initialAction;

  const AuthEmailForm({
    super.key,
    this.initialAction = AuthAction.signIn,
  });

  @override
  ConsumerState<AuthEmailForm> createState() => _AuthEmailFormState();
}

class _AuthEmailFormState extends ConsumerState<AuthEmailForm> {
  late AuthAction action;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pwController = TextEditingController();
  final TextEditingController confirmPwController = TextEditingController();

  String errorMessage = '';
  bool loading = false;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    action = widget.initialAction;
  }

  String? validateEmailField() {
    final email = emailController.text;
    if (email.isEmpty) {
      return "Email is required";
    }
    if (!RegExp(r"^\S+@\S+\.\S+$").hasMatch(email)) {
      return "Invalid email";
    }
    return null;
  }

  String? validatePasswordField() {
    final password = pwController.text;
    if (password.isEmpty) {
      return "Password is required";
    }
    if (password.length < 6) {
      return "Password must be at least 6 characters long";
    }
    return null;
  }

  String? validateConfirmPasswordField() {
    final password = pwController.text;
    final confirmPassword = confirmPwController.text;
    if (confirmPassword.isEmpty) {
      return "Password confirmation is required";
    }
    if (confirmPassword != password) {
      return "Passwords do not match";
    }
    return null;
  }

  void submitForm() async {
    final email = emailController.text;
    final password = pwController.text;
    if (_formKey.currentState!.validate()) {
      try {
        setState(() => loading = true);
        final authNotifier = ref.read(authProvider.notifier);

        if (action == AuthAction.signIn) {
          await authNotifier.signInWithPassword(email, password);
        } else if (action == AuthAction.signUp) {
          await authNotifier.signUp(email, password);
          if (mounted) {
            setState(() => action = AuthAction.signIn);
            showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: const Text("Verify your email"),
                content: const Text("We've sent you an email to verify your account"),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("OK"),
                  )
                ],
              ),
            );
          }
        }
        if (mounted) setState(() => loading = false);
      } on AuthException catch (e) {
        setState(() {
          loading = false;
          errorMessage = e.message;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Center(
      child: SingleChildScrollView(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 400),
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: AutofillGroup(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    action == AuthAction.signIn ? "Sign in" : "Create Account",
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  if (action == AuthAction.signUp) ...[
                    const SizedBox(height: 16),
                    const Text(
                      'Create an account to get started',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                  const SizedBox(height: 32),
                  TextFormField(
                    controller: emailController,
                    enabled: !loading,
                    autofocus: true,
                    decoration: const InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(),
                    ),
                    validator: (_) => validateEmailField(),
                    keyboardType: TextInputType.emailAddress,
                    autofillHints: const [AutofillHints.email],
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: pwController,
                    enabled: !loading,
                    decoration: const InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                    validator: (_) => validatePasswordField(),
                    autofillHints: const [AutofillHints.password],
                  ),
                  if (action == AuthAction.signUp) ...[
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: confirmPwController,
                      enabled: !loading,
                      decoration: const InputDecoration(
                        labelText: "Confirm Password",
                        border: OutlineInputBorder(),
                      ),
                      obscureText: true,
                      validator: (_) => validateConfirmPasswordField(),
                      autofillHints: const [AutofillHints.password],
                    ),
                  ],
                  if (errorMessage.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        errorMessage,
                        style: TextStyle(color: colorScheme.error),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: loading ? null : submitForm,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        action == AuthAction.signUp ? "Create Account" : "Sign in",
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        action = action == AuthAction.signIn ? AuthAction.signUp : AuthAction.signIn;
                        errorMessage = "";
                      });
                    },
                    child: Text(
                      action == AuthAction.signIn ? "Create an account" : "Back to Sign in",
                    ),
                  ),
                  if (action == AuthAction.signIn)
                    TextButton(
                      onPressed: () => context.goNamed('forgot-password'),
                      child: const Text("Forgot password?"),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
