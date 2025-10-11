import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:smart_notes/features/auth/screen/login_screen.dart';
import 'package:smart_notes/features/folder/screen/folder_screen_copy.dart';
import 'package:smart_notes/model/auth_input/auth_input.dart';
import 'package:smart_notes/network/network_api.dart';

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

                    final response = await api.authMethod.signupAccount(
                      authData: data,
                    );
                    setState(() {});

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Signed up successfully')),
                    );

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FolderScreenCopy(),
                      ),
                    );
                  } on MapperException catch (error) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Signup succeeded but parsing failed: ${error.toString()}',
                        ),
                      ),
                    );
                  } on FormatException catch (error) {
                    final msg = error.toString();
                    if (msg.contains('MapperException')) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Signup response couldn\'t be parsed: $msg',
                          ),
                        ),
                      );
                    }
                  } catch (error) {
                    final msg = error.toString();
                    if (msg.contains('MapperException')) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Signup response couldn\'t be parsed: $msg',
                          ),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text(msg)));
                    }
                  }
                },
                child: const Text("Signup"),
              ),

              Text("You alrady have an account?"),
              TextButton(
                child: Text('Sign in'),

                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
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
