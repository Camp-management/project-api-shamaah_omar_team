import 'package:flutter/material.dart';
import 'package:smart_notes/model/auth/auth_model.dart';
import 'package:smart_notes/model/auth_input/auth_input.dart';
import 'package:smart_notes/network/network_api.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final api = NetworkApi();

  String? token;

  final TextEditingController controllerUserName = TextEditingController(
    text: 'user@example.com',
  );
  final TextEditingController controllerPassword = TextEditingController(
    text: 'string',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              TextField(
                controller: controllerUserName,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: controllerPassword,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  try {
                    final data = AuthInput(
                      email: controllerUserName.text,
                      password: controllerPassword.text,
                    );

                    final AuthModel response = await api.authMethod
                        .signupAccount(authData: data);

                    setState(() {
                      token = response.access_token;
                      print(token);
                    });

                    // For debugging only (avoid logging tokens in prod)
                    debugPrint('TOKEN: $token');

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Signed in successfully')),
                    );
                  } on FormatException catch (error) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(error.message)));
                  } catch (error) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(error.toString())));
                  }
                },
                child: const Text("Signup"),
              ),

              // Optional: show it in UI while debugging
              if (token != null) ...[
                const SizedBox(height: 12),
                Text(
                  'Token (debug): ${token!.substring(0, 20)}...',
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
