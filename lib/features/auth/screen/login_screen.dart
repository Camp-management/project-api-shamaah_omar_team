// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:smart_notes/common/custom_widegt/auth_text_field.dart';
import 'package:smart_notes/features/auth/screen/signup_screen.dart';
import 'package:smart_notes/model/auth_input/auth_input.dart';
import 'package:smart_notes/network/network_api.dart';

import '../../folder/screen/folder_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final api = NetworkApi();
  String? token;

  final TextEditingController controllerUserName = TextEditingController(
    text: 'user@example.com',
  );
  final TextEditingController controllerPassword = TextEditingController(
    text: 'string',
  );

  @override
  void initState() {
    super.initState();
    _redirectIfLoggedIn();
  }

  Future<void> _redirectIfLoggedIn() async {
    final box = GetStorage();
    final saved = box.read<String>('token');

    if (saved != null && saved.isNotEmpty) {
      // Navigate after first frame to avoid context issues in initState
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const FolderScreen()),
        );
      });
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
                name: "Email",
                isEmail: true,
                controller: controllerUserName,
              ),

              const SizedBox(height: 16),

              AuthTextField(
                controller: controllerPassword,
                name: "Password",
                isPassword: true,
              ),
              const SizedBox(height: 30),
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

                    final response = await api.authMethod.loginAccount(
                      authData: data,
                    );

                    token = response.access_token;
                    final box = GetStorage();
                    await box.write("token", token);

                    if (!mounted) return;
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Color.fromARGB(255, 72, 172, 255),
                          content: Text('Signed in successfully',style: TextStyle(fontSize: 20))),
                    );

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FolderScreen(),
                      ),
                    );
                  } on FormatException catch (error) {
                    if (!mounted) return;
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(
                        backgroundColor: Color(0xFFFE4A49),
                        content: Text(error.message,style: TextStyle(fontSize: 20))));
                  } catch (error) {
                    if (!mounted) return;
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(
                        backgroundColor: Color(0xFFFE4A49),
                        content: Text(error.toString(),style: TextStyle(fontSize: 20))));
                  }
                },
                child: const Text("Login",style: TextStyle(
                fontSize: 20),),
              ),
              const SizedBox(height: 10),
              const Text("You don't have an account?"),
              TextButton(
                child: const Text('Sign Up'),
                style: ButtonStyle(
                  foregroundColor: WidgetStatePropertyAll<Color>(Colors.black),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const SignupScreen()),
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
