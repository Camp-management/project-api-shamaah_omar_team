// ignore_for_file: use_build_context_synchronously

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:smart_notes/common/custom_widegt/auth_text_field.dart';
import 'package:smart_notes/features/folder/screen/folder_screen_copy.dart';
import 'package:smart_notes/model/auth_input/auth_input.dart';
import 'package:smart_notes/network/network_api.dart';
import 'package:smart_notes/features/auth/screen/login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final api = NetworkApi();

  final TextEditingController controllerUserName = TextEditingController(
    text: 'user@example.com',
  );
  final TextEditingController controllerPassword = TextEditingController(
    text: 'string',
  );

  bool _loading = false;

  Future<void> _handleSignup() async {
    if (_loading) return;
    setState(() => _loading = true);

    final creds = AuthInput(
      email: controllerUserName.text.trim(),
      password: controllerPassword.text,
    );

    try {
      // 1) Sign up (no token expected from this endpoint)
      await api.authMethod.signupAccount(authData: creds);

      // 2) Immediately log in to obtain token
      final loginRes = await api.authMethod.loginAccount(authData: creds);
      final token = loginRes.access_token;

      await GetStorage().write('token', token);

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Account created & signed in')),
      );

      // 3) Go straight into app
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const FolderScreenCopy()),
      );
    } on MapperException catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Parsing failed: $e')));
    } on FormatException catch (e) {
      // e.g., backend requires verification and login failed
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.message)));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginScreen()),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AuthTextField(
                name: "email",
                isEmail: true,
                controller: controllerUserName,
              ),
              const SizedBox(height: 16),
              AuthTextField(
                controller: controllerPassword,
                name: "Password",
                isPassword: true,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _loading ? null : _handleSignup,
                child: Text(_loading ? 'Please wait…' : 'Signup'),
              ),
              const SizedBox(height: 8),
              const Text("You already have an account?"),
              TextButton(
                child: const Text('Sign in'),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const LoginScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
