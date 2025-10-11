// ignore_for_file: use_build_context_synchronously

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:smart_notes/common/custom_widegt/auth_text_field.dart';
import 'package:smart_notes/features/auth/screen/login_screen.dart';
import 'package:smart_notes/model/auth_input/auth_input.dart';
import 'package:smart_notes/network/network_api.dart';
import 'package:smart_notes/features/auth/screen/login_screen.dart';

import '../../folder/screen/folder_screen.dart';

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
        MaterialPageRoute(builder: (_) => const FolderScreen()),
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
              Text("Smart Notes",style: TextStyle(fontSize: 30),),
              SizedBox(height: 30,),
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
                style: ElevatedButton.styleFrom(
                  foregroundColor:Colors.black,
                  fixedSize: Size(350, 50),
                  shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onPressed: () async {
                  try {
                    final data = AuthInput(
                      email: controllerUserName.text,
                      password: controllerPassword.text,
                    );

                    // ignore: unused_local_variable
                    final response = await api.authMethod.signupAccount(
                      authData: data,
                    );
                    setState(() {});

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          backgroundColor:Color.fromARGB(255, 72, 172, 255),
                          content: Text('Signed up successfully'
                              ,style: TextStyle(fontSize: 20))),
                    );

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FolderScreen(),
                      ),
                    );
                  } on MapperException catch (error) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Color(0xFFFE4A49),
                        content: Text(
                          'Signup succeeded but parsing failed: ${error.toString()}',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    );
                  } on FormatException catch (error) {
                    final msg = error.toString();
                    if (msg.contains('MapperException')) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Color(0xFFFE4A49),
                          content: Text(
                            'Signup response couldn\'t be parsed: $msg',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      );
                    }
                  } catch (error) {
                    final msg = error.toString();
                    if (msg.contains('MapperException')) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Color(0xFFFE4A49),
                          content: Text(
                            'Signup response couldn\'t be parsed: $msg',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Color(0xFFFE4A49),
                          content: Text(msg, style: TextStyle(fontSize: 20)),
                        ),
                      );
                    }
                  }
                },
                child: const Text("Sign up"),
              ),
              const SizedBox(height: 8),
              const Text("You already have an account?"),
               SizedBox(height: 10),

              Text("You already have an account?"),
              TextButton(
                child: Text('Sign in',),
                style: ButtonStyle(
                  foregroundColor: WidgetStatePropertyAll<Color>(Colors.black),
                ),
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
